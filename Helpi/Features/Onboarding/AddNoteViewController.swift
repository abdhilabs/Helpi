//
//  PersonalNotesViewController.swift
//  Helpi
//
//  Created by PUTRI RAHMADEWI on 29/06/22.
//

import UIKit

class AddNoteViewController: UIViewController {
  
  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var lblDescription: UILabel!
  @IBOutlet weak var txtNote: UITextView!
  @IBOutlet weak var btnSave: UIButton!
  private var lblPlaceholder: UILabel!
  
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

    txtNote.delegate = self
    lblPlaceholder = UILabel()
    lblPlaceholder.numberOfLines = 0
    lblPlaceholder.text = "Masukkan catatan anda di sini..."
    lblPlaceholder.font = .rounded(ofSize: 15, weight: .regular)
    lblPlaceholder.sizeToFit()
    txtNote.addSubview(lblPlaceholder)
    lblPlaceholder.frame.origin = CGPoint(x: 5, y: (txtNote.font?.pointSize)! / 2)
    lblPlaceholder.textColor = .tertiaryLabel
    lblPlaceholder.isHidden = !txtNote.text.isEmpty
    
    //add shadow
    txtNote.layer.cornerRadius = 8
    txtNote.layer.masksToBounds = false
    txtNote.layer.shadowColor = UIColor.black.cgColor
    txtNote.layer.shadowOpacity = 0.25
    txtNote.layer.shadowOffset = .zero
    txtNote.layer.shadowRadius = 5
    txtNote.layer.shouldRasterize = true

    
    //Set Font Family
    lblTitle.font = .rounded(ofSize: 24, weight: .semibold)
    lblDescription.font = .rounded(ofSize: 17, weight: .regular)
    txtNote.font = .rounded(ofSize: 15, weight: .regular)
    btnSave.titleLabel?.font = .rounded(ofSize: 17, weight: .semibold)
    
    addTapGestureToHideKeyboard()
  }
  
  @IBAction func btnSave(_ sender: Any) {
    let notes = txtNote.text ?? ""
    if notes.isEmpty == true {
      showAlert()
      return
    }

    showLoading()
    
    account.notes = notes
    
    do {
      try connectivityHandler.updateApplicationContext(applicationContext: ["notes": account.notes, "recordName": account.recordId.recordName])
    } catch {
      print("Error: \(error)")
    }
    
    cloudKitService.register(by: account) { isSuccess in
      DispatchQueue.main.async {
        if isSuccess {
          self.hideLoading()
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
          self.hideLoading()
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

extension AddNoteViewController : UITextViewDelegate {
  func textViewDidChange(_ textView: UITextView) {
    lblPlaceholder.isHidden = !textView.text.isEmpty
  }
}
