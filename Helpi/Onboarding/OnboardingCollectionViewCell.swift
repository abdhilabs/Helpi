//
//  OnboardingCollectionViewCell.swift
//  Helpi
//
//  Created by PUTRI RAHMADEWI on 27/06/22.
//

import UIKit
import Lottie

class OnboardingCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var animationContainer: UIView!
    
    @IBOutlet weak var descriptionText: UILabel!
    static let identifier = "OnboardingCollectionViewCell"
    
    var animation = AnimationView()


       
       // Instance of the Lottie AnimationView
    func configureCell(onboarding: dataOnboarding){
        animation = AnimationView(name: onboarding.animationName)
        animation.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height * 0.8)
                
                // customize the animation
                animation.animationSpeed = 1
                animation.loopMode = .loop
                animation.play()
                
                animationContainer.addSubview(animation)
//            self.image.image = UIImage(named: onboarding.image)
//        self.image.frame = CGRect(x: 0, y: 0, width: 0, height: self.frame.height * 0.8);
        self.descriptionText.text = onboarding.description
        self.title.text = onboarding.title
        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
