//
//  SettingViewController.swift
//  Helpi
//
//  Created by Miftakhul Huda on 19/08/22.
//

import UIKit
import ContactsUI

class SettingViewController: UIViewController {

  @IBOutlet weak var imgUser: UIImageView!
  @IBOutlet weak var lblUsername: UILabel!
  @IBOutlet weak var lblTitlePengaturan: UILabel!
  @IBOutlet weak var tblSettings: UITableView!
  
  struct CellContent {
    let icon : String
    let title : String
  }
  
  let cellData : [CellContent] = [
    CellContent(icon: "note.text", title: "Catatan Pribadi"),
    CellContent(icon: "timer", title: "Pengatur Waktu"),
    CellContent(icon: "phone", title: "Kontak Darurat"),
    CellContent(icon: "bell", title: "Pengingat")
  ]
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      imgUser.image = UIImage(systemName: "person.fill")
      imgUser.layer.borderWidth = 1
      imgUser.layer.masksToBounds = false
      imgUser.layer.borderColor = UIColor.black.cgColor
      imgUser.layer.cornerRadius = imgUser.frame.size.height/2
      imgUser.clipsToBounds = true
      
      lblUsername.text = "Miftakhul Huda"
      tblSettings.delegate = self
      tblSettings.dataSource = self
      tblSettings.register(UINib(nibName: "SettingTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingTableViewCell")
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cellData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
    
    let cellContent = cellData[indexPath.row]
    
    cell.imageIcon.image = UIImage(systemName: cellContent.icon)
    cell.imageIcon.tintColor = #colorLiteral(red: 1, green: 0.1843137255, blue: 0.02745098039, alpha: 1)
    cell.labelTitle.text = cellContent.title
    cell.accessoryType = .disclosureIndicator
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedIndex = indexPath.row
    
    switch selectedIndex {
    case 0:
      let intent = PersonalNoteSettingViewController(nibName: "PersonalNoteSettingViewController", bundle: nil)
      self.navigationController?.pushViewController(intent, animated: true)
      
    case 1:
      let intent = TimeSettingViewController(nibName: "TimeSettingViewController", bundle: nil)
      self.navigationController?.pushViewController(intent, animated: true)
      
    case 2:
      let intent = EmergencyContactViewController(nibName: "EmergencyContactViewController", bundle: nil)
      self.navigationController?.pushViewController(intent, animated: true)
      
    case 3:
      let intent = ReminderViewController(nibName: "ReminderViewController", bundle: nil)
      self.navigationController?.pushViewController(intent, animated: true)
      
    default:
      print("Intent Failed")
    }
  }
  
  @objc func showMyViewControllerInACustomizedSheet(intent : UIViewController) {
      let viewControllerToPresent = intent
      if let sheet = viewControllerToPresent.sheetPresentationController {
          sheet.detents = [.large()]
          sheet.largestUndimmedDetentIdentifier = .medium
          sheet.prefersScrollingExpandsWhenScrolledToEdge = false
          sheet.prefersEdgeAttachedInCompactHeight = true
          sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
      }
      present(intent, animated: true, completion: nil)
  }
}