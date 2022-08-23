//
//  PersonalNotesViewController.swift
//  Helpi
//
//  Created by PUTRI RAHMADEWI on 29/06/22.
//

import UIKit

class AddNoteViewController: UIViewController {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var textNotes: UILabel!
  @IBOutlet weak var notes: UITextView!
  @IBOutlet weak var btnSave: UIButton!
  
  private let cloudKitService = CloudKitService()
  private let connectivityHandler = WatchSessionManager.shared
  
  var account: UserAccount
  
  init(account: UserAccount) {
    self.account = account
    super.init(nibName: String(describing: AddNoteViewController.self), bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    btnSave.backgroundColor = #colorLiteral(red: 1, green: 0.1843137255, blue: 0.02745098039, alpha: 1)
    btnSave.dropShadow()
    btnSave.layer.cornerRadius = 10
    
    //add shadow
    notes.layer.masksToBounds = false
    notes.layer.shadowColor = UIColor.black.cgColor
    notes.layer.shadowOpacity = 0.25
    notes.layer.shadowOffset = .zero
    notes.layer.shadowRadius = 5
    notes.layer.shouldRasterize = true
  
    
    //Set Font Family
    titleLabel.font = .rounded(ofSize: 24, weight: .semibold)
    textNotes.font = .rounded(ofSize: 17, weight: .regular)
    notes.font = .rounded(ofSize: 15, weight: .regular)
    btnSave.titleLabel?.font = .rounded(ofSize: 17, weight: .semibold)
    
    addTapGestureToHideKeyboard()
  }
  
  @IBAction func btnSave(_ sender: Any) {
    let notes = notes.text ?? ""
    if notes.isEmpty == true {
      showAlert()
      return
    }
    
    account.notes = notes
    
    //        do {
    //            try connectivityHandler.updateApplicationContext(applicationContext: ["notes": account.notes, "recordName": account.recordId.recordName])
    //        } catch {
    //            print("Error: \(error)")
    //        }
    
    cloudKitService.register(by: account) { isSuccess in
      DispatchQueue.main.async {
        if isSuccess {
          SessionManager.shared.setPersonalNote(with: notes)
          
          do {
            try self.connectivityHandler.updateApplicationContext(applicationContext: [
              "notes": notes,
              "recordName": SessionManager.shared.getRecordId()
            ])
          } catch {
            print("Error: \(error)")
          }
          
          let nextFirstAid = ActivationViewController()
          self.navigationController?.pushViewController(nextFirstAid, animated: true)
        } else {
          self.showGeneralAlert(message: "Gagal mendaftar akun")
        }
      }
    }
  }
  
  func showAlert(){
    let alert = UIAlertController(title: "Empty Notes", message: "Are you sure you want to leave the notes empty? you can edit it later", preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    
    alert.addAction(UIAlertAction(title: "Confirm", style: .destructive , handler: {  action in
      let nextFirstAid = ActivationViewController()
      self.navigationController?.pushViewController(nextFirstAid, animated: true)
    }))
    
    present(alert, animated: true)
  }
  
  @IBAction func skipBtn(_ sender: Any) {
    let nextFirstAid = ActivationViewController()
    self.navigationController?.pushViewController(nextFirstAid, animated: true)
  }
  
}
