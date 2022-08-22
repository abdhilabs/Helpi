//
//  EmergencyContactTableViewCell.swift
//  Helpi
//
//  Created by Miftakhul Huda on 22/08/22.
//

import UIKit

class EmergencyContactTableViewCell: UITableViewCell {

  @IBOutlet weak var lblContactName: UILabel!
  @IBOutlet weak var lblContactNumber: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
