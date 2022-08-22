//
//  DoneViewController.swift
//  Helpi
//
//  Created by PUTRI RAHMADEWI on 30/06/22.
//

import UIKit

class DoneViewController: UIViewController {
  
  @IBOutlet weak var labelTerimakasih: UILabel!
  
  @IBOutlet weak var labelDesc: UILabel!
  @IBOutlet weak var btnHome: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    btnHome.layer.cornerRadius = 20
    labelTerimakasih.font = .rounded(ofSize: 50, weight: .black)
    labelDesc.font = .rounded(ofSize: 24, weight: .semibold)
    btnHome.titleLabel?.font = .rounded(ofSize: 17, weight: .semibold)
    
    // Do any additional setup after loading the view.
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: animated)
  }
  
  @IBAction func btnHome(_ sender: Any) {
    dismiss(animated: true)
  }
  
}

extension UIFont {
  class func rounded(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
    let systemFont = UIFont.systemFont(ofSize: size, weight: weight)
    let font: UIFont
    
    if let descriptor = systemFont.fontDescriptor.withDesign(.rounded) {
      font = UIFont(descriptor: descriptor, size: size)
    } else {
      font = systemFont
    }
    return font
  }
}

//extension UIButton {
//  func dropShadow(color: UIColor, opacity: Float = 0, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
////    layer.masksToBounds = false
//    layer.shadowColor = color.cgColor
//    layer.shadowOpacity = opacity
//    layer.shadowRadius = radius
//    //    layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 5).cgPath
//    layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
//    //    layer.shouldRasterize = true
////    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
//  }
//}

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

