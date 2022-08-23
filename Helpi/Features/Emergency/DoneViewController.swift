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
  @IBOutlet weak var lblNote: UILabel!

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: animated)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    let attributedString = NSMutableAttributedString(string: "Terima Kasih\nsudah membantu saya!")
    attributedString.addAttribute(.font, value: UIFont.rounded(ofSize: 50, weight: .black), range: NSRange(location: 0, length: 12))
    attributedString.addAttribute(.font, value: UIFont.rounded(ofSize: 24, weight: .semibold), range: NSRange(location: 13, length: 20))

    lblTitle.attributedText = attributedString

    lblNote.font = .rounded(ofSize: 17, weight: .regular)
    let noteAttributedString = NSMutableAttributedString(string: lblNote.text ?? "")
    noteAttributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 17, weight: .semibold), range: NSRange(location: 0, length: 28))
    noteAttributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 17, weight: .semibold), range: NSRange(location: 52, length: 20))
    lblNote.attributedText = noteAttributedString

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

