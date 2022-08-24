//
//  MedicineReminderTableViewCell.swift
//  Helpi
//
//  Created by Miftakhul Huda on 23/08/22.
//

import UIKit

class TimeSelectionTableViewCell: UITableViewCell {

  @IBOutlet weak var lblCellTitle: UILabel!
  
  override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
    
    lblCellTitle.font = UIFont.font(type: .sfRegular, size: 17)
  }
    
}
