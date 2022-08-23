//
//  FriendTableViewCell.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 01/07/22.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
  
  @IBOutlet weak var lblTitle: UILabel!
  
  var addHandler: (()-> Void)? = nil
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  @IBAction func didTapAddButton(_ sender: Any) {
    addHandler?()
  }
}
