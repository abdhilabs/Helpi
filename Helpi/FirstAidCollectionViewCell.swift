//
//  FirstAidCollectionViewCell.swift
//  Helpi
//
//  Created by PUTRI RAHMADEWI on 29/06/22.
//

import UIKit

class FirstAidCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var imageFirstAid: UIImageView!
    
    static let identifier = "FirstAidCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(FirstAid: FirstAid){
            
 
//        self.imageFirstAid.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height * 0.8)
            
            // customize the animation
            
            // set the title and description of the screen
            self.imageFirstAid.image = UIImage(named: FirstAid.image)
            self.titleLabel.text = FirstAid.title
            self.descriptionText.text = FirstAid.description
            self.descriptionText.font = .rounded(ofSize: 16, weight: .bold)
            self.titleLabel.font = .rounded(ofSize: 36, weight: .bold)
        }

}

