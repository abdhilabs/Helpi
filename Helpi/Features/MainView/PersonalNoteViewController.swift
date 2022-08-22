//
//  PersonalNoteViewController.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 30/06/22.
//

import UIKit

class PersonalNoteViewController: UIViewController {
  
  @IBOutlet weak var viewNotes: UIView!
  @IBOutlet weak var btnStart: UIButton!
  @IBOutlet weak var lblNote: UILabel!
  
  private let cloudKitService = CloudKitService()
  
  private var account: UserAccount? = nil
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.viewNotes.layer.cornerRadius = 10
    btnStart.dropShadow()
    //    let notes = SessionManager.shared.getPersonalNote()
    //    lblNote.text = notes
  }
  
  @IBAction func didTapStartButton(_ sender: Any) {
    let nextFirstScreenController = FirstAidScreen()
    if let account = account {
      let emergencyPhonePrimary = account.emergencyPhonePrimary
        .trimmingAllSpaces()
      let emergencyPhoneSecondary = account.emergencyPhoneSecondary
        .trimmingAllSpaces()
      
      nextFirstScreenController.emergencyPhonePrimary = emergencyPhonePrimary
      nextFirstScreenController.emergencyPhoneSecondary = emergencyPhoneSecondary
    }
    self.navigationController?.pushViewController(nextFirstScreenController, animated: true)
  }
}
