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

  @IBOutlet weak var descriptionText: UILabel!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var titleJudul2: UILabel!
  @IBOutlet weak var fullName1: UITextField!
  @IBOutlet weak var phoneNumber2: UITextField!
  @IBOutlet weak var phoneNumber1: UITextField!
  @IBOutlet weak var fullName2: UITextField!

  @IBOutlet weak var btnContact1: UIButton!
  @IBOutlet weak var titleJudul1: UILabel!

  @IBOutlet weak var btnSave: UIButton!

  @IBOutlet weak var btnContact2: UIButton!
  @IBOutlet weak var btnSkip: UIButton!

  var contactFrom: ContactFrom = .contactPrimary

  var name: String = ""
  var appleId: String = ""

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.

    //Sent Font Family
    titleLabel.font = .rounded(ofSize: 24, weight: .semibold)
    descriptionText.font = .rounded(ofSize: 17, weight: .regular)
    titleJudul1.font = .rounded(ofSize: 17, weight: .semibold)
    titleJudul2.font = .rounded(ofSize: 17, weight: .semibold)
    fullName1.font = .rounded(ofSize: 17, weight: .regular)
    fullName2.font = .rounded(ofSize: 17, weight: .regular)
    phoneNumber1.font = .rounded(ofSize: 17, weight: .regular)
    phoneNumber2.font = .rounded(ofSize: 17, weight: .regular)
    btnContact1.titleLabel?.font = .rounded(ofSize: 17, weight: .regular)
    btnContact2.titleLabel?.font = .rounded(ofSize: 17, weight: .regular)
    btnSkip.titleLabel?.font = .rounded(ofSize: 17, weight: .regular)
    btnSave.backgroundColor = #colorLiteral(red: 0.2392156863, green: 0.2352941176, blue: 0.5137254902, alpha: 1)
    btnSave.layer.cornerRadius = 20
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: animated)
  }



  func didAddContact() {
    let vc1 = CNContactPickerViewController()
    vc1.delegate = self
    present(vc1, animated: true)
  }



  @IBAction func btnSave(_ sender: Any) {
    if let emergencyNamePrimary = fullName1.text, let emergencyPhonePrimary = phoneNumber1.text  {
      let account = getAccountData(emergencyNamePrimary: emergencyNamePrimary, emergencyPhonePrimary: emergencyPhonePrimary)

      let nextNotesController = PersonalNotesViewController(account: account)
      self.navigationController?.pushViewController(nextNotesController, animated: true)
    } else {
      showAlert()
    }
  }

  func showAlert(){
    let alert = UIAlertController(title: "The Field Couldn’t Empty", message: "Need to input at least 1 Emergency Contact", preferredStyle: .alert)

    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { [self] action in
    }))

    present(alert, animated: true)
  }

  @IBAction func btnContact1(_ sender: Any) {
    showAlertContact1()
  }



  @IBAction func btnContact2(_ sender: Any) {
    showAlertContact2()
  }

  func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
    let name = contact.givenName + " " + contact.familyName
    let number = ((contact.phoneNumbers.first?.value)! as CNPhoneNumber).stringValue
    switch contactFrom {
    case .contactPrimary:
      fullName1.text = name
      phoneNumber1.text = number
    case .contactSecondary:
      fullName2.text = name
      phoneNumber2.text = number
    }

  }

  func showAlertContact1(){
    let alert = UIAlertController(title: "“Helpi” Would Like to Access Your Contacts", message: "Upload your emergency contacts to Helpi so first responders know who to reach out in case of emergency.", preferredStyle: .alert)

    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { [self] action in
    }))

    alert.addAction(UIAlertAction(title: "OK", style: .destructive , handler: {  action in
      self.contactFrom = .contactPrimary
      self.didAddContact()
    }))


    present(alert, animated: true)
  }

  func showAlertContact2(){
    let alert = UIAlertController(title: "“Helpi” Would Like to Access Your Contacts", message: "Upload your emergency contacts to Helpi so first responders know who to reach out in case of emergency.", preferredStyle: .alert)

    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { [self] action in
    }))

    alert.addAction(UIAlertAction(title: "OK", style: .destructive , handler: {  action in
      self.contactFrom = .contactSecondary
      self.didAddContact()
    }))


    present(alert, animated: true)
  }

  @IBAction func btnSkip(_ sender: Any) {
    let account = getAccountData(emergencyNamePrimary: "", emergencyPhonePrimary: "")
    let nextNotesController = PersonalNotesViewController(account: account)
    self.navigationController?.pushViewController(nextNotesController, animated: true)
  }

  private func getAccountData(emergencyNamePrimary: String, emergencyPhonePrimary: String) -> UserAccount {
    let emergencyNameSecondary = fullName2.text ?? ""
    let emergencyPhoneSecondary = phoneNumber2.text ?? ""

    let account = UserAccount(name: name, appleId: appleId,
                              emergencyNamePrimary: emergencyNamePrimary, emergencyNameSecondary: emergencyNameSecondary,
                              emergencyPhonePrimary: emergencyPhonePrimary, emergencyPhoneSecondary: emergencyPhoneSecondary)
    return account
  }
}
