//
//  MedicineReminderViewController.swift
//  Helpi
//
//  Created by Miftakhul Huda on 22/08/22.
//

import UIKit

class MedicineReminderViewController: UIViewController {

  @IBOutlet weak var dpTimePicker: UIDatePicker!
  @IBOutlet weak var lblTest: UILabel!
  
  override func viewDidLoad() {
        super.viewDidLoad()

    dpTimePicker.locale = .current
    dpTimePicker.datePickerMode = .time
    dpTimePicker.preferredDatePickerStyle = .wheels
    dpTimePicker.addTarget(self, action: #selector(dateSelected), for: .valueChanged)
    
    }
  
  @objc
  func dateSelected() {
    let dateFormatter = DateFormatter()
    dateFormatter.timeStyle = .short
    let time = dateFormatter.string(from: dpTimePicker.date)
    lblTest.text = time
  }

}
