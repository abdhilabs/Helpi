//
//  PersonalNoteSettingViewController.swift
//  Helpi
//
//  Created by Miftakhul Huda on 19/08/22.
//

import UIKit

class PersonalNoteSettingViewController: UIViewController {
  
  @IBOutlet weak var lblDescription: UILabel!
  @IBOutlet weak var txtPersonalNote: UITextView!
  @IBOutlet weak var lblExample: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    lblDescription.font = UIFont.font(type: .sfRegular, size: 13)
    txtPersonalNote.font = UIFont.font(type: .sfRegular, size: 17)
    lblExample.font = UIFont.font(type: .sfRegular, size: 13)
    
    txtPersonalNote.backgroundColor = .white
    txtPersonalNote.layer.cornerRadius = 10
    txtPersonalNote.layer.shadowOffset = CGSize(width: 10, height: 10)
    txtPersonalNote.layer.shadowRadius = 5
    txtPersonalNote.layer.shadowOpacity = 1
    
    configureItems()
    
  }
  
  private func configureItems() {
    navigationItem.rightBarButtonItem = UIBarButtonItem(
      barButtonSystemItem: .save, target: self, action: nil
    )
  }
  
  
  
}
