//
//  SettingTableViewCell.swift
//  Helpi
//
//  Created by Miftakhul Huda on 19/08/22.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
  
  
  @IBOutlet weak var imageIcon: UIImageView!
  @IBOutlet weak var labelTitle: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
