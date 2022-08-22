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
  
  func setRecordId(with recordName: String) {
    UserDefaults.standard.setValue(recordName, forKey: "set_record_id")
  }
  
  func getRecordId() -> String {
    UserDefaults.standard.value(forKey: "set_record_id") as? String ?? ""
  }
  
  func setPersonalNote(with note: String) {
    UserDefaults.standard.setValue(note, forKey: "personal_note")
  }
  
  func getPersonalNote() -> String {
    UserDefaults.standard.value(forKey: "personal_note") as? String ?? ""
  }
}
