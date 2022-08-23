//
//  GuideTableViewCell.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 23/08/22.
//

import UIKit

struct Guide {
  let title: String
  let description: NSMutableAttributedString
}

class GuideTableViewCell: UITableViewCell {

  @IBOutlet weak var viewContainerBackground: UIView!
  @IBOutlet weak var viewNumberBackground: UIView!
  @IBOutlet weak var lblNumber: UILabel!
  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var lblDescription: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()

    viewContainerBackground.layer.cornerRadius = 10
    viewContainerBackground.layer.borderWidth = 1
    viewContainerBackground.layer.borderColor = #colorLiteral(red: 1, green: 0.1843137255, blue: 0.02745098039, alpha: 1)

    viewNumberBackground.layer.cornerRadius = viewNumberBackground.frame.height / 2
  }

  func configureView(guide: Guide) {
    lblTitle.text = guide.title
    lblDescription.attributedText = guide.description
  }

}
