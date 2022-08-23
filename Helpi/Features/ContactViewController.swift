//
//  ContactViewController.swift
//  Helpi
//
//  Created by PUTRI RAHMADEWI on 29/06/22.
//

import UIKit
import Contacts
import ContactsUI

enum ContactFrom {
  case contactPrimary, contactSecondary
}

class ContactViewController: UIViewController, CNContactPickerDelegate  {
  
  @IBOutlet weak var lblDescription: UILabel!
  @IBOutlet weak var lblTitle: UILabel!

  @IBOutlet weak var lblFirstEmergencyTitle: UILabel!
  @IBOutlet weak var btnFirstEmergencyContact: UIButton!
  @IBOutlet weak var txtFirstEmergencyName: UITextField!
  @IBOutlet weak var txtFirstEmergencyPhone: UITextField!

  @IBOutlet weak var lblSecondaryEmergencyTitle: UILabel!
  @IBOutlet weak var btnSecondaryEmergencyContact: UIButton!
  @IBOutlet weak var txtSecondaryEmergencyName: UITextField!
  @IBOutlet weak var txtSecondaryEmergencyPhone: UITextField!

  @IBOutlet weak var btnSave: UIButton!
  @IBOutlet weak var btnSkip: UIButton!
  
  var contactFrom: ContactFrom = .contactPrimary
  
  var name: String = ""
  var appleId: String = ""
  var userId: String = ""
  var identityTokenString: String = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    
    //Sent Font Family
    lblTitle.font = .rounded(ofSize: 24, weight: .semibold)
    lblDescription.font = .rounded(ofSize: 17, weight: .regular)
    lblFirstEmergencyTitle.font = .rounded(ofSize: 17, weight: .semibold)
    lblSecondaryEmergencyTitle.font = .rounded(ofSize: 17, weight: .semibold)
    txtFirstEmergencyName.font = .rounded(ofSize: 17, weight: .regular)
    txtSecondaryEmergencyName.font = .rounded(ofSize: 17, weight: .regular)
    txtFirstEmergencyPhone.font = .rounded(ofSize: 17, weight: .regular)
    txtSecondaryEmergencyPhone.font = .rounded(ofSize: 17, weight: .regular)
    btnFirstEmergencyContact.titleLabel?.font = .rounded(ofSize: 17, weight: .regular)
    btnSecondaryEmergencyContact.titleLabel?.font = .rounded(ofSize: 17, weight: .regular)
    btnSave.backgroundColor = #colorLiteral(red: 1, green: 0.1843137255, blue: 0.02745098039, alpha: 1)
    btnSave.layer.cornerRadius = 10
    btnSave.dropShadow()
    btnSave.titleLabel?.font = .rounded(ofSize: 17, weight: .semibold)
    btnSkip.titleLabel?.font = .rounded(ofSize: 17, weight: .regular)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: animated)
  }
  
  func didAddContact() {
    let nextViewController = CNContactPickerViewController()
    nextViewController.delegate = self
    present(nextViewController, animated: true)
  }
  
  @IBAction func btnSave(_ sender: Any) {
    if let emergencyNamePrimary = txtFirstEmergencyName.text, let emergencyPhonePrimary = txtFirstEmergencyPhone.text  {
      let account = getAccountData(emergencyNamePrimary: emergencyNamePrimary, emergencyPhonePrimary: emergencyPhonePrimary)
      
      let nextNotesController = AddNoteViewController(account: account)
      self.navigationController?.pushViewController(nextNotesController, animated: true)
    } else {
      showAlert()
    }
  }
  
  func showAlert() {
    let alert = UIAlertController(title: "The Field Couldn’t Empty", message: "Need to input at least 1 Emergency Contact", preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "OK", style: .default))
    
    present(alert, animated: true)
  }
  
  @IBAction func didTapFirstContactButton(_ sender: Any) {
    self.contactFrom = .contactPrimary
    self.didAddContact()
  }
  
  @IBAction func didTapSecondaryContactButton(_ sender: Any) {
    self.contactFrom = .contactSecondary
    self.didAddContact()
  }
  
  func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
    let name = contact.givenName + " " + contact.familyName
    let number = ((contact.phoneNumbers.first?.value) as? CNPhoneNumber)?.stringValue
    switch contactFrom {
    case .contactPrimary:
      txtFirstEmergencyName.text = name
      txtFirstEmergencyPhone.text = number
    case .contactSecondary:
      txtSecondaryEmergencyName.text = name
      txtSecondaryEmergencyPhone.text = number
    }
  }
  
  @IBAction func btnSkip(_ sender: Any) {
    let account = getAccountData(emergencyNamePrimary: "", emergencyPhonePrimary: "")
    let nextNotesController = AddNoteViewController(account: account)
    self.navigationController?.pushViewController(nextNotesController, animated: true)
  }
  
  private func getAccountData(emergencyNamePrimary: String, emergencyPhonePrimary: String) -> UserAccount {
    let emergencyNameSecondary = txtSecondaryEmergencyName.text ?? ""
    let emergencyPhoneSecondary = txtSecondaryEmergencyPhone.text ?? ""
    
    let account = UserAccount(identityTokenString: identityTokenString,
                              userId: userId, name: name, appleId: appleId,
                              emergencyNamePrimary: emergencyNamePrimary, emergencyNameSecondary: emergencyNameSecondary,
                              emergencyPhonePrimary: emergencyPhonePrimary, emergencyPhoneSecondary: emergencyPhoneSecondary)
    return account
  }
}
