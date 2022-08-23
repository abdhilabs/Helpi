//
//  customButton.swift
//  Helpi
//
//  Created by PUTRI RAHMADEWI on 21/08/22.
//

import UIKit

final class CustomButton: UIButton {
  
  private var shadowLayer: CAShapeLayer!
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    if shadowLayer == nil {
      shadowLayer = CAShapeLayer()
      shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 12).cgPath
      shadowLayer.fillColor = UIColor.white.cgColor
      
      shadowLayer.shadowColor = UIColor.darkGray.cgColor
      shadowLayer.shadowPath = shadowLayer.path
      shadowLayer.shadowOffset = CGSize(width: 2.0, height: 2.0)
      shadowLayer.shadowOpacity = 0.8
      shadowLayer.shadowRadius = 2
      
      layer.insertSublayer(shadowLayer, at: 0)
      //layer.insertSublayer(shadowLayer, below: nil) // also works
    }
  }
  
}
