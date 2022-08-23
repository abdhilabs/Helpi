//
//  DoneViewController.swift
//  Helpi
//
//  Created by PUTRI RAHMADEWI on 30/06/22.
//

import UIKit

class DoneViewController: UIViewController {
  
  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var btnHome: UIButton!

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: animated)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    lblTitle.font = .rounded(ofSize: 50, weight: .black)
    btnHome.layer.cornerRadius = 20
    btnHome.titleLabel?.font = .rounded(ofSize: 17, weight: .semibold)
  }
  
  @IBAction func didTapHomeButton(_ sender: Any) {
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

