//
//  CloudKitService.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 30/06/22.
//

import CloudKit

struct UserAccount {
  var recordId: CKRecord.ID = .init()
  var name: String
  var appleId: String
  var emergencyNamePrimary: String
  var emergencyNameSecondary: String
  var emergencyPhonePrimary: String
  var emergencyPhoneSecondary: String
  var notes: String = ""
  var notification: String = "0"
}

extension UserAccount {
  static let recordType = "Helpi"

  var record: CKRecord {
    let record = CKRecord(recordType: UserAccount.recordType)
    record["appleId"] = appleId
    record["name"] = name
    record["emergencyNamePrimary"] = emergencyNamePrimary
    record["emergencyNameSecondary"] = emergencyNameSecondary
    record["emergencyPhonePrimary"] = emergencyPhonePrimary
    record["emergencyPhoneSecondary"] = emergencyPhoneSecondary
    record["notes"] = notes
    record["notification"] = notification
    return record
  }
}

class CloudKitService {

  private let publicDatabase: CKDatabase = CKContainer(identifier: "iCloud.com.mc2.helpi").publicCloudDatabase

  func register(by param: UserAccount, completion: @escaping (_ isSuccess: Bool) -> ()) {
    publicDatabase.save(param.record) { record, error in
      if error == nil {
        SessionManager.shared.setRecordId(with: record?.recordID.recordName ?? "")
        completion(true)
        print("Success register")
      } else {
        completion(false)
      }
    }
  }

  func fetchFriend(by name: String, completion: @escaping (_ accounts: [UserAccount]) -> ()) {
    let query = CKQuery(recordType: UserAccount.recordType, predicate: NSPredicate(value: true))
    //    query.sortDescriptors = [NSSortDescriptor(key: "recordName", ascending: false)]

    let operation = CKQueryOperation(query: query)

    var accounts: [UserAccount] = []
    operation.recordMatchedBlock = { (recordId, result) in
      switch result {
      case .success(let record):
        if let name = record["name"] as? String,
           let appleId = record["appleId"] as? String,
           let emergencyNamePrimary = record["emergencyNamePrimary"] as? String,
           let emergencyNameSecondary = record["emergencyNameSecondary"] as? String,
           let emergencyPhonePrimary = record["emergencyPhonePrimary"] as? String,
           let emergencyPhoneSecondary = record["emergencyPhoneSecondary"] as? String,
           let notes = record["notes"] as? String,
           let notification = record["notification"] as? String {
          accounts.append(UserAccount(recordId: recordId, name: name, appleId: appleId,
                                        emergencyNamePrimary: emergencyNamePrimary, emergencyNameSecondary: emergencyNameSecondary,
                                        emergencyPhonePrimary: emergencyPhonePrimary, emergencyPhoneSecondary: emergencyPhoneSecondary,
                                        notes: notes, notification: notification))
          print("Name: \(name)")
          print("AppleId: \(appleId)")
          print("RecordIDs: \(recordId)")
        }
      case .failure(let error):
        print("Error: \(error.localizedDescription)")
      }
    }

    operation.queryResultBlock = { result in
      DispatchQueue.main.async {
        completion(accounts.filter { $0.name.lowercased().contains(name) })
      }
    }

    publicDatabase.add(operation)
  }

  func fetchAccount(by recordId: CKRecord.ID, completion: @escaping (_ account: UserAccount) -> ()) {
    publicDatabase.fetch(withRecordID: recordId) { record, error in
      if error == nil {
        if let record = record,
           let name = record["name"] as? String,
           let appleId = record["appleId"] as? String,
           let emergencyNamePrimary = record["emergencyNamePrimary"] as? String,
           let emergencyNameSecondary = record["emergencyNameSecondary"] as? String,
           let emergencyPhonePrimary = record["emergencyPhonePrimary"] as? String,
           let emergencyPhoneSecondary = record["emergencyPhoneSecondary"] as? String,
           let notes = record["notes"] as? String,
           let notification = record["notification"] as? String {
          let account = UserAccount(recordId: recordId, name: name, appleId: appleId,
                                    emergencyNamePrimary: emergencyNamePrimary, emergencyNameSecondary: emergencyNameSecondary,
                                    emergencyPhonePrimary: emergencyPhonePrimary, emergencyPhoneSecondary: emergencyPhoneSecondary,
                                    notes: notes, notification: notification)
          completion(account)
          print("Name: \(name)")
          print("AppleId: \(appleId)")
          print("RecordIDs: \(recordId)")
        }
      } else {
        print("Could not fetch record")
      }
    }
  }

  func updateDataFriend(by recordId: CKRecord.ID, completion: @escaping (_ name: String) -> ()) {
    let randomValue = Int.random(in: 1...1000)
    publicDatabase.fetch(withRecordID: recordId) { record, error in
      if error == nil {
        record?.setValue("Change with value \(randomValue)", forKey: "notification")
        self.publicDatabase.save(record!) { newRecord, error in
          if error == nil {
            completion(newRecord?["name"] as? String ?? "")
            print("Record Updated")
          } else {
            print("Record Not Saved")
          }
        }
      } else {
        print("Could not fetch record")
      }
    }
  }

  func subscribeToDatabase(for appleId: String, completion: @escaping (_ isSuccess: Bool) -> ()) {
    let subscription = CKQuerySubscription(recordType: UserAccount.recordType, predicate: NSPredicate(format: "appleId == %@", appleId), options: .firesOnRecordUpdate)

    let info = CKSubscription.NotificationInfo()
    info.alertBody = "I got fainted"
    info.shouldBadge = true
    info.soundName = "default"

    subscription.notificationInfo = info

    publicDatabase.save(subscription) { subscription, error in
      if error == nil {
        completion(true)
        print("Subscription saved successfully with id \(subscription?.subscriptionID)")
      } else {
        completion(false)
        print("Error: \(error?.localizedDescription)")
      }
    }
  }
}
