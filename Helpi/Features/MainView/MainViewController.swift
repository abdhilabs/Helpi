//
//  MainViewController.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 23/06/22.
//

import UIKit

class MainViewController: UIViewController {
  
  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var lblDescription: UILabel!
  @IBOutlet weak var viewHelpButton: UIImageView!
  
  private let cloudKitService = CloudKitService()
  private let connectivityHandler = WatchSessionManager.shared
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: true)
    //    getPersonalNotes()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViews()
    lblTitle.font = .rounded(ofSize: 34, weight: .bold)
    lblDescription.font = .rounded(ofSize: 18, weight: .regular)
  }
  
  private func getPersonalNotes() {
    let recordId = SessionManager.shared.getRecordId()
    cloudKitService.fetchAccount(by: .init(recordName: recordId)) { account in
      SessionManager.shared.setPersonalNote(with: account.notes)
      do {
        try self.connectivityHandler.updateApplicationContext(applicationContext: ["notes": account.notes, "recordName": account.recordId.recordName])
      } catch {
        print("Error: \(error)")
      }
    }
  }
  
  private func configureViews() {
    viewHelpButton.layer.cornerRadius = viewHelpButton.frame.size.width / 2
    viewHelpButton.clipsToBounds = true
    viewHelpButton.isUserInteractionEnabled = true
    viewHelpButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapHelpButton)))
  }
  
  @objc func didTapHelpButton() {
    let nextViewController = HelpViewController()
    let navigation = UINavigationController(rootViewController: nextViewController)
    navigation.modalPresentationStyle = .fullScreen
    present(navigation, animated: true)
  }
  
  override func leftNavigationBarButtonTapped(sender: UIBarButtonItem?) {
    let nextViewController = AddFriendViewController()
    let navigation = UINavigationController(rootViewController: nextViewController)
    present(navigation, animated: true)
  }
}
