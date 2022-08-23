//
//  EmergencyContactViewController.swift
//  Helpi
//
//  Created by Miftakhul Huda on 19/08/22.
//

import UIKit
import ContactsUI

class EmergencyContactViewController: UIViewController {
  
  @IBOutlet weak var tblEmergencyContact: UITableView!
  @IBOutlet weak var lblDescription: UILabel!
  
  var contactFrom: ContactFrom = .contactPrimary
  
  struct CellContent {
    let name : String
    let number : String
  }
  
  let cellData : [CellContent] = [
    CellContent(name: "Ayah", number: "081234567890"),
    CellContent(name: "Adik", number: "080987654321")
  ]

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    lblDescription.font = .font(type: .sfRegular, size: 13)
    
    tblEmergencyContact.delegate = self
    tblEmergencyContact.dataSource = self
    tblEmergencyContact.register(UINib(nibName: "EmergencyContactTableViewCell", bundle: nil), forCellReuseIdentifier: "EmergencyContactTableViewCell")
  }
}

extension EmergencyContactViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cellData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "EmergencyContactTableViewCell", for: indexPath) as! EmergencyContactTableViewCell
    
    let cellContent = cellData[indexPath.row]
    
    cell.lblContactName.text = cellContent.name
    cell.lblContactNumber.text = cellContent.number
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
}

extension EmergencyContactViewController: CNContactPickerDelegate {
  func didAddContact() {
    let pickerController = CNContactPickerViewController()
    pickerController.delegate = self
    present(pickerController, animated: true)
  }
  
  func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
    let name = contact.givenName + " " + contact.familyName
    let number = ((contact.phoneNumbers.first?.value) as? CNPhoneNumber)?.stringValue
    
    //    switch contactFrom {
    //    case .contactPrimary:
    //      lblContactName.text = name
    //      lblContactNumber.text = number
    //    case .contactSecondary:
    //      lblContactName.text = name
    //      lblContactNumber.text = number
    //    }
  }
}
