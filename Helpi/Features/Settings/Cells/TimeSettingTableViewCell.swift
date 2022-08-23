//
//  TimeSettingTableViewCell.swift
//  Helpi
//
//  Created by Miftakhul Huda on 20/08/22.
//

import UIKit

class TimeSettingTableViewCell: UITableViewCell {
  
  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var lblValue: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
