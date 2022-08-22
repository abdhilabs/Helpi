//
//  UIFont.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 19/08/22.
//

import UIKit

enum FontType {
  case sfBlack
  case sfBold
  case sfHeavy
  case sfLight
  case sfMedium
  case sfRegular
  case sfSemibold
  case sfThin
  case sfUltralight
}

extension UIFont {
  class func font(type: FontType, size: CGFloat) -> UIFont {
    switch type {
    case .sfBlack:
      return UIFont(name: "SF-Compact-Rounded-Black", size: size) ?? .systemFont(ofSize: size)
    case .sfBold:
      return UIFont(name: "SF-Compact-Rounded-Bold", size: size) ?? .systemFont(ofSize: size)
    case .sfHeavy:
      return UIFont(name: "SF-Compact-Rounded-Heavy", size: size) ?? .systemFont(ofSize: size)
    case .sfLight:
      return UIFont(name: "SF-Compact-Rounded-Light", size: size) ?? .systemFont(ofSize: size)
    case .sfMedium:
      return UIFont(name: "SF-Compact-Rounded-Medium", size: size) ?? .systemFont(ofSize: size)
    case .sfRegular:
      return UIFont(name: "SF-Compact-Rounded-Regular", size: size) ?? .systemFont(ofSize: size)
    case .sfSemibold:
      return UIFont(name: "SF-Compact-Rounded-Semibold", size: size) ?? .systemFont(ofSize: size)
    case .sfThin:
      return UIFont(name: "SF-Compact-Rounded-Thin", size: size) ?? .systemFont(ofSize: size)
    case .sfUltralight:
      return UIFont(name: "SF-Compact-Rounded-Ultralight", size: size) ?? .systemFont(ofSize: size)
    }
  }
}
