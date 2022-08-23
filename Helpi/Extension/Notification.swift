//
//  Notification.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 23/08/22.
//

import Foundation

func createPublisher(for notification: NSNotification.Name) -> NotificationCenter.Publisher {
  return NotificationCenter.default.publisher(for: notification)
}

struct Notifications {
  static let dismissLoading = NSNotification.Name(rawValue: "dismissLoading")
}

public extension NSNotification.Name {
  func post(with object: Any? = nil) {
    NotificationCenter.default.post(name: self, object: object)
  }
}
