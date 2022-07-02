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
    
  }
}
