//
//  CloudKitService.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 30/06/22.
//

import CloudKit

struct FriendAccount {
  var recordId: CKRecord.ID
  var name: String
  var appleId: String
  var emergencyNamePrimary: String
  var emergencyNameSecondary: String
  var emergencyPhonePrimary: String
  var emergencyPhoneSecondary: String
  var notes: String
  var notification: Int = 0
}

extension FriendAccount {
  static let recordType = "Helpi"

  var record: CKRecord {
    let record = CKRecord(recordType: FriendAccount.recordType)
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

  func register(by param: FriendAccount) {
    publicDatabase.save(param.record) { record, error in
      if error == nil {
        print("Success register")
      }
    }
  }

  func fetchFriend(by name: String, completion: @escaping (_ accounts: [FriendAccount]) -> ()) {
    let query = CKQuery(recordType: FriendAccount.recordType, predicate: NSPredicate(value: true))
    //    query.sortDescriptors = [NSSortDescriptor(key: "recordName", ascending: false)]

    let operation = CKQueryOperation(query: query)

    var accounts: [FriendAccount] = []
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
           let notification = record["notification"] as? Int {
          accounts.append(FriendAccount(recordId: recordId, name: name, appleId: appleId,
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
        completion(accounts.filter { $0.name.contains(name) })
      }
    }

    publicDatabase.add(operation)
  }

  func updateDataFriend(by account: FriendAccount) {
    let randomValue = Int.random(in: 1...1000)
    publicDatabase.fetch(withRecordID: account.recordId) { record, error in
      if error == nil {
        record?.setValue(randomValue, forKey: "notification")
        self.publicDatabase.save(record!) { newRecord, error in
          if error == nil {
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
    //    abdhikun & abdhe
    let subscription = CKQuerySubscription(recordType: FriendAccount.recordType, predicate: NSPredicate(format: "appleId == %@", appleId), options: .firesOnRecordCreation)

    //    let subscription = CKQuerySubscription(recordType: "Persons", predicate: NSPredicate(format: "TRUEPREDICATE"), options: .firesOnRecordCreation)

    let info = CKSubscription.NotificationInfo()
    //    info.titleLocalizationKey = "%1$@"
    //    info.titleLocalizationArgs = "\(["name"]) need "
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
