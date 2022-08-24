//
//  ReminderScheduleTableViewCell.swift
//  Helpi
//
//  Created by Miftakhul Huda on 23/08/22.
//

import UIKit

class ReminderScheduleTableViewCell: UITableViewCell {

  @IBOutlet weak var lblTime: UILabel!
  @IBOutlet weak var lblDescription: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
      lblTime.font = UIFont.font(type: .sfSemibold, size: 28)
      lblDescription.font = UIFont.font(type: .sfRegular, size: 13)
    }
}
