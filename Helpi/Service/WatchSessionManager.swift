//
//  WatchKitService.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 17/07/22.
//

import WatchConnectivity

typealias MessageReceived = (session: WCSession, message: [String: Any], replyHandler: (([String: Any]) -> Void)?)
typealias ApplicationContextReceived = (session: WCSession, applicationContext: [String: Any])

protocol WatchOSDelegate: AnyObject  {
  func messageReceived(tuple: MessageReceived)
  func applicationContextReceived(tuple: ApplicationContextReceived)
}

protocol iOSDelegate: AnyObject {
  func messageReceived(tuple: MessageReceived)
  func applicationContextReceived(tuple: ApplicationContextReceived)
}

class WatchSessionManager: NSObject {

  static let shared = WatchSessionManager()

  weak var watchOSDelegate: WatchOSDelegate?
  weak var iOSDelegate: iOSDelegate?

  fileprivate let session: WCSession? = WCSession.isSupported() ? .default : nil

  var validSession: WCSession? {

    #if os(iOS)
    if let session = session, session.isPaired && session.isWatchAppInstalled {
      return session
    }
    return nil
    #elseif os(watchOS)
    return session
    #endif
  }

  func startSession() {
    session?.delegate = self
    session?.activate()
  }

}

extension WatchSessionManager: WCSessionDelegate {

  func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    print("activationDidCompleteWith activationState:\(activationState) error:\(String(describing: error))")
  }

  #if os(iOS)

  func sessionDidBecomeInactive(_ session: WCSession) {
    print("sessionDidBecomeInactive: \(session)")
  }

  func sessionDidDeactivate(_ session: WCSession) {
    print("sessionDidDeactivate: \(session)")
  }

  #endif
}

extension WatchSessionManager {

  private var validReachableSession: WCSession? {
    if let session = validSession, session.isReachable {
      return session
    }
    return nil
  }

  func sendMessage(message: [String : Any], replyHandler: (([String : Any]) -> Void)? = nil, errorHandler: ((Error) -> Void)? = nil) {
      validReachableSession?.sendMessage(message, replyHandler: replyHandler, errorHandler: errorHandler)
  }

  func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
    handleSession(session, didReceiveMessage: message)
  }

  func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
    replyHandler(["notes": SessionManager.shared.getPersonalNote(), "recordName": SessionManager.shared.getRecordId()])
  }

  func handleSession(_ session: WCSession, didReceiveMessage message: [String: Any], replyHandler: (([String: Any]) -> Void)? = nil) {
    #if os(iOS)
    iOSDelegate?.messageReceived(tuple: (session, message, replyHandler))
    #elseif os(watchOS)
    watchOSDelegate?.messageReceived(tuple: (session, message, replyHandler))
    #endif
  }
}

extension WatchSessionManager {

  func updateApplicationContext(applicationContext: [String: Any]) throws {
    if let session = validSession {
      do {
        try session.updateApplicationContext(applicationContext)
      } catch let error {
        throw error
      }
    }
  }

  func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String: Any]) {
    #if os(iOS)
    iOSDelegate?.applicationContextReceived(tuple: (session, applicationContext))
    #elseif os(watchOS)
    watchOSDelegate?.applicationContextReceived(tuple: (session, applicationContext))
    #endif
  }
}
