//
//  OnboardViewController.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 26/06/22.
//

import UIKit
import CloudKit
import UserNotifications

class OnboardViewController: UIViewController {

  @IBOutlet weak var btnGotoMain: UIButton!

  let publicDatabase = CKContainer.init(identifier: "iCloud.com.mc2.helpi.patient").publicCloudDatabase

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  @IBAction func didTapGotoMainButton(_ sender: Any) {
    let nextViewController = HelpViewController()
    navigationController?.pushViewController(nextViewController, animated: true)
  }

  @IBAction func didTapSubscribeButton(_ sender: Any) {
    //    abdhikun & abdhe
    let subscription = CKQuerySubscription(recordType: "Persons", predicate: NSPredicate(format: "name == %@", "abdhe"), options: .firesOnRecordCreation)

    //    let subscription = CKQuerySubscription(recordType: "Persons", predicate: NSPredicate(format: "TRUEPREDICATE"), options: .firesOnRecordCreation)

    let info = CKSubscription.NotificationInfo()
    info.titleLocalizationKey = "%1$@"
    info.titleLocalizationArgs = ["name"]
    info.alertBody = "A new notification has been posted!"
    info.shouldBadge = true
    info.soundName = "default"

    subscription.notificationInfo = info

    publicDatabase.save(subscription) { subscription, error in
      if error == nil {
        print("Subscription saved successfully")
      } else {
        print("Error: \(error?.localizedDescription)")
      }
    }
  }
}
