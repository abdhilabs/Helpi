//
//  UIButton.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 23/08/22.
//

import UIKit

extension UIButton {
  func dropShadow(scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOpacity = 0.25
    layer.shadowOffset = .zero
    layer.shadowRadius = 5
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }
}
