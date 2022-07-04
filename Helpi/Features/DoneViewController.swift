//
//  DoneViewController.swift
//  Helpi
//
//  Created by PUTRI RAHMADEWI on 30/06/22.
//

import UIKit

class DoneViewController: UIViewController {
    
    @IBOutlet weak var labelThankyou: UILabel!
    @IBOutlet weak var btnHome: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnHome.layer.cornerRadius = 20
        labelThankyou.font = .rounded(ofSize: 38, weight: .bold)
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

