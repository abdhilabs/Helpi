//
//  FirstAidCollectionViewCell.swift
//  Helpi
//
//  Created by PUTRI RAHMADEWI on 29/06/22.
//

import UIKit

class FirstAidCollectionViewCell: UICollectionViewCell {
  
  
  
  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var image1: UIImageView!
  @IBOutlet weak var image2: UIImageView!
  @IBOutlet weak var image3: UIImageView!
  @IBOutlet weak var text1: UILabel!
  @IBOutlet weak var text2: UILabel!
  @IBOutlet weak var text3: UILabel!
  static let identifier = "FirstAidCollectionViewCell"
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  func configureCell(FirstAid: FirstAid){
    
    
    //        self.imageFirstAid.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height * 0.8)
    
    // customize the animation
    
    // set the title and description of the screen
    self.lblTitle.text = FirstAid.title
    self.text1.text = FirstAid.guide[0].description
    self.text2.text = FirstAid.guide[1].description
    self.text2.text = FirstAid.guide[2].description
    self.image1.image = UIImage(named: FirstAid.guide[0].image)
    self.image2.image = UIImage(named: FirstAid.guide[1].image)
    self.image3.image = UIImage(named: FirstAid.guide[2].image)
    self.text1.font = .rounded(ofSize: 17, weight: .regular)
    self.text2.font = .rounded(ofSize: 17, weight: .regular)
    self.text3.font = .rounded(ofSize: 17, weight: .regular)
    self.lblTitle.font = .rounded(ofSize: 36, weight: .semibold)

  }
  
}

