//
//  ReminderViewController.swift
//  Helpi
//
//  Created by Miftakhul Huda on 21/08/22.
//

import UIKit

class ReminderViewController: UIViewController {
  
  @IBOutlet weak var viewEKG: UIView!
  @IBOutlet weak var lblEKGTitle: UILabel!
  @IBOutlet weak var lblEKGDescription: UILabel!
  @IBOutlet weak var viewMedicine: UIView!
  @IBOutlet weak var lblMedicineTitle: UILabel!
  @IBOutlet weak var lblMedicineDescription: UILabel!
  @IBOutlet weak var lblReminderDescription: UILabel!
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    lblEKGTitle.font = .rounded(ofSize: 18, weight: .semibold)
    lblEKGDescription.font = .rounded(ofSize: 15, weight: .regular)
    lblEKGDescription.textColor = #colorLiteral(red: 0.5137254902, green: 0.5137254902, blue: 0.5137254902, alpha: 1)
    lblMedicineTitle.font = .rounded(ofSize: 18, weight: .semibold)
    lblMedicineDescription.font = .rounded(ofSize: 15, weight: .regular)
    lblMedicineDescription.textColor = #colorLiteral(red: 0.5137254902, green: 0.5137254902, blue: 0.5137254902, alpha: 1)
    lblReminderDescription.font = .rounded(ofSize: 13, weight: .regular)
    
    viewEKG.isUserInteractionEnabled = true
    
    let tapGestureEKG = UITapGestureRecognizer.init(target: self, action: #selector(onClickView))
    tapGestureEKG.numberOfTapsRequired = 1
    viewEKG.addGestureRecognizer(tapGestureEKG)
    
    let tapGestureMedicine = UITapGestureRecognizer.init(target: self, action: #selector(onClickView))
    tapGestureMedicine.numberOfTapsRequired = 1
    viewMedicine.addGestureRecognizer(tapGestureMedicine)
  }
  
  @objc func onClickView(){
    self.navigationController?.pushViewController(ReminderScheduleViewController(nibName: "ReminderScheduleViewController", bundle: nil), animated: true)
  }
  
  
  
}
