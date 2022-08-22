//
//  HistoryLogTableViewCell.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 22/08/22.
//

import UIKit

class HistoryLogTableViewCell: UITableViewCell {

  @IBOutlet weak var viewDayBackground: UIView!
  @IBOutlet weak var lblDay: UILabel!
  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var lblTime: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
    setupViews()
  }

  func setupViews() {
    viewDayBackground.layer.cornerRadius = viewDayBackground.frame.height / 2
  }
  
}
