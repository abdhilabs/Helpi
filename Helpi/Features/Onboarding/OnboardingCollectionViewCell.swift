//
//  OnboardingCollectionViewCell.swift
//  Helpi
//
//  Created by PUTRI RAHMADEWI on 27/06/22.
//

import UIKit
import Lottie

class OnboardingCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var imageOnboarding: UIImageView!
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var descriptionText: UILabel!
  
  static let identifier = "OnboardingCollectionViewCell"
  
  var animation = AnimationView()
  var image = UIImageView()
  
  // Instance of the Lottie AnimationView
  func configureCell(onboarding: Onboarding){
    animation = AnimationView(name: onboarding.image)
    animation.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: imageOnboarding.frame.height)
    
    //Customize the animation
    animation.animationSpeed = 1
    animation.loopMode = .loop
    animation.play()
    imageOnboarding.addSubview(animation)
    
    self.imageOnboarding.image = UIImage(named: onboarding.image)
    
    //Set Title
    self.descriptionText.text = onboarding.description
    self.title.text = onboarding.title
    self.title.font = .rounded(ofSize:24, weight: .semibold)
    self.descriptionText.font = .rounded(ofSize: 17, weight: .regular)
    
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    
  }
  
}
