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
  @IBOutlet weak var lblGuide: UILabel!

  private let cloudKitService = CloudKitService()
  
  private var account: UserAccount? = nil
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViews()
  }

  private func configureViews() {
    viewNotes.layer.cornerRadius = 10
    viewNotes.layer.borderWidth = 1
    viewNotes.layer.borderColor = #colorLiteral(red: 0.8117647059, green: 0.8549019608, blue: 0.8980392157, alpha: 1)

    btnStart.dropShadow()
    let notes = SessionManager.shared.getPersonalNote()
    lblNote.text = notes

    let attributedText = NSMutableAttributedString(string: lblGuide.text ?? "")
    attributedText.addAttribute(.font, value: UIFont.systemFont(ofSize: 17, weight: .bold),
                                range: NSRange(location: 13, length: 25))

    showLoading()
    let recordId = SessionManager.shared.getRecordId()
    cloudKitService.fetchAccount(by: .init(recordName: recordId)) { account in
      self.hideLoading()
      self.account = account
    }

    lblGuide.attributedText = attributedText
  }
  
  @IBAction func didTapStartButton(_ sender: Any) {
    let nextFirstScreenController = FirstAidViewController()
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
