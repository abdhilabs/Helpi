//
//  SummaryTableViewCell.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 22/08/22.
//

import UIKit
import HealthKit

class SummaryTableViewCell: UITableViewCell {
  
  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var imgUnit: UIImageView!
  @IBOutlet weak var lblUnit: UILabel!
  @IBOutlet weak var lblDate: UILabel!
  
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupViews()
    
  }
  
  private func setupViews() {
    
  }
  
}
