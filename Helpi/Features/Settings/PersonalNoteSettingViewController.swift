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

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: true)
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    addTapGestureToHideKeyboard()
    
    lblDescription.font = .rounded(ofSize: 14, weight: .regular)
    txtPersonalNote.font = .rounded(ofSize: 17, weight: .regular)
    lblExample.font = .rounded(ofSize: 14, weight: .regular)

    txtPersonalNote.layer.cornerRadius = 8
    txtPersonalNote.layer.masksToBounds = false
    txtPersonalNote.layer.shadowColor = UIColor.black.cgColor
    txtPersonalNote.layer.shadowOpacity = 0.25
    txtPersonalNote.layer.shadowOffset = .zero
    txtPersonalNote.layer.shadowRadius = 5
    txtPersonalNote.layer.shouldRasterize = true

  }
}
