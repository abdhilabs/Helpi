//
//  Notifications.swift
//  WatchHelpi WatchKit Extension
//
//  Created by Abdhi P (Work) on 20/07/22.
//

import Foundation

func createPublisher(for notification: NSNotification.Name) -> NotificationCenter.Publisher {
  return NotificationCenter.default.publisher(for: notification)
}

struct Notifications {
  static let showTimer = NSNotification.Name(rawValue: "showTimer")
}

public extension NSNotification.Name {
  func post(with object: Any? = nil) {
    NotificationCenter.default.post(name: self, object: object)
  }
}
