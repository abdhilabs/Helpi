//
//  ContactViewController.swift
//  Helpi
//
//  Created by PUTRI RAHMADEWI on 29/06/22.
//

import UIKit
import Contacts
import ContactsUI

enum ContactFrom{
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
        btnSkip.titleLabel?.font = .rounded(ofSize: 17, weight: .semibold)
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
        if fullName1.text?.isEmpty == true && phoneNumber1.text?.isEmpty == true && fullName2.text?.isEmpty == true && phoneNumber2.text?.isEmpty == true {
            showAlert()
        }
        
        let nextNotesController = PersonalNotesViewController()
        self.navigationController?.pushViewController(nextNotesController, animated: true)
        
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "The Field Couldn’t Empty", message: "Need to input at least 1 Emergency Contact", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { [self] action in
        }))
        
        present(alert, animated: true)
    }
    
    @IBAction func btnContact1(_ sender: Any) {
        contactFrom = .contactPrimary
        didAddContact()
    }
    
    @IBAction func btnContact2(_ sender: Any) {
        contactFrom = .contactSecondary
        didAddContact()
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
    
    
    @IBAction func btnSkip(_ sender: Any) {
        let nextNotesController = PersonalNotesViewController()
        self.navigationController?.pushViewController(nextNotesController, animated: true)
    }
}
