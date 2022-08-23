//
//  EKGReminderTableViewCell.swift
//  Helpi
//
//  Created by Miftakhul Huda on 22/08/22.
//

import UIKit

class EKGReminderTableViewCell: UITableViewCell {
  
  @IBOutlet weak var lblTime: UILabel!
  @IBOutlet weak var lblDescription: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    lblTime.font = UIFont.font(type: .sfSemibold, size: 28)
    lblDescription.font = UIFont.font(type: .sfRegular, size: 13)
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
