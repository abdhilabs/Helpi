//
//  SessionManager.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 03/07/22.
//

import Foundation
import CloudKit

struct SessionManager {

  static let shared = SessionManager()

  func isShowOnboard() -> Bool {
    UserDefaults.standard.value(forKey: "is_show_onboard") as? Bool ?? false
  }

  func setShowOnboard() {
    UserDefaults.standard.setValue(true, forKey: "is_show_onboard")
  }

  func isLoggedIn() -> Bool {
    UserDefaults.standard.value(forKey: "is_logged_in") as? Bool ?? false
  }

  func setLoggedIn() {
    UserDefaults.standard.setValue(true, forKey: "is_logged_in")
  }

  func setRecordId(recordId: CKRecord.ID) {
    UserDefaults.standard.setValue(recordId, forKey: "set_record_id")
  }

  func getRecordId() -> CKRecord.ID {
    UserDefaults.standard.value(forKey: "set_record_id") as? CKRecord.ID ?? .init()
  }
}
