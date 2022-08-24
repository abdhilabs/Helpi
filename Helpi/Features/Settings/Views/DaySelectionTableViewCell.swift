//
//  DaySelectionTableViewCell.swift
//  Helpi
//
//  Created by Miftakhul Huda on 23/08/22.
//

import UIKit

class DaySelectionTableViewCell: UITableViewCell {

  @IBOutlet weak var lblRepeatDay: UILabel!
  
  override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
    
    lblRepeatDay.font = UIFont.font(type: .sfRegular, size: 17)
  }
}
