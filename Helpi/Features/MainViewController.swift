//
//  MainViewController.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 23/06/22.
//

import UIKit
import CloudKit

class MainViewController: UIViewController {

  @IBOutlet weak var txtName: UITextField!

  let publicDatabase = CKContainer.init(identifier: "iCloud.com.mc2.helpi.patient").publicCloudDatabase

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  @IBAction func didTapSaveButton(_ sender: Any) {
    let name = txtName.text ?? ""

    let record = CKRecord(recordType: "Persons")
    record.setValue(name, forKey: "name")

    publicDatabase.save(record) { saveRecord, error in
      if error == nil {
        print("Record saved...")
      } else {
        print("Record not saved...(\(String(describing: error?.localizedDescription)))")
      }
    }
  }

  @IBAction func didTapRetrieveButton(_ sender: Any) {
    let predicate = NSPredicate(value: true)

    let query = CKQuery(recordType: "Persons", predicate: predicate)
//    query.sortDescriptors = [NSSortDescriptor(key: "recordName", ascending: false)]

    let operation = CKQueryOperation(query: query)

    titles.removeAll()
    recordIDs.removeAll()

    operation.recordMatchedBlock = { (recordId, result) in
      switch result {
      case .success(let record):
        titles.append(record["name"]!)
        recordIDs.append(recordId)
      case .failure(let error):
        print("Error: \(error.localizedDescription)")
      }
    }

    operation.queryResultBlock = { result in
      DispatchQueue.main.async {
        print("Name: \(titles)")
        print("RecordIDs: \(recordIDs)")
      }
    }

    publicDatabase.add(operation)
  }

  @IBAction func didTapUpdateButton(_ sender: Any) {
  }

  @IBAction func didTapDeleteButton(_ sender: Any) {
    let recordID = recordIDs.first!

    publicDatabase.delete(withRecordID: recordID) { deletedRecordId, error in
      if error == nil {
        print("Record Deleted")
      } else {
        print("Error: \(error?.localizedDescription)")
      }
    }
  }
}
