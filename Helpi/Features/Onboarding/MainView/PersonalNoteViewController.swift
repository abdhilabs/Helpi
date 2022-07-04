//
//  PersonalNoteViewController.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 30/06/22.
//

import UIKit

class PersonalNoteViewController: UIViewController {

  @IBOutlet weak var lblNote: UILabel!

  private let cloudKitService = CloudKitService()

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: true)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    observeValue()
  }

  private func observeValue() {
    let recordId = SessionManager.shared.getRecordId()
    cloudKitService.fetchAccount(by: recordId) { account in
      self.lblNote.text = account.notes
    }
  }

  @IBAction func didTapStartButton(_ sender: Any) {
    let nextFirstScreenController = FirstAidScreen()
    self.navigationController?.pushViewController(nextFirstScreenController, animated: true)
  }
}
