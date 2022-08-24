//
//  OnboardingCollectionViewCell.swift
//  Helpi
//
//  Created by PUTRI RAHMADEWI on 27/06/22.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var imgIllustration: UIImageView!
  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var lblDescription: UILabel!
  
  static let identifier = "OnboardingCollectionViewCell"
  
  var image = UIImageView()
  
  // Instance of the Lottie AnimationView
  func configureCell(onboarding: Onboarding){
    self.imgIllustration.image = UIImage(named: onboarding.image)
    
    //Set Title
    self.lblTitle.text = onboarding.title
    self.lblTitle.font = .rounded(ofSize:24, weight: .semibold)
    self.lblDescription.text = onboarding.description
    self.lblDescription.font = .rounded(ofSize: 17, weight: .regular)
    
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    
  }
  
}
