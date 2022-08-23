//
//  ReminderViewController.swift
//  Helpi
//
//  Created by Miftakhul Huda on 21/08/22.
//

import UIKit

class ReminderViewController: UIViewController {

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
}
