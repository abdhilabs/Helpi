//
//  HomeViewController.swift
//  Helpi
//
//  Created by PUTRI RAHMADEWI on 01/07/22.
//

import UIKit

class HomeViewController: UIViewController {
  
  @IBOutlet weak var titleLabel2: UILabel!
  @IBOutlet weak var btnHome: UIButton!
  @IBOutlet weak var titleLabel1: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    btnHome.layer.cornerRadius = 20
    titleLabel1.font = .rounded(ofSize: 28, weight: .bold)
    titleLabel2.font = .rounded(ofSize: 18, weight: .medium)
    btnHome.titleLabel?.font = .rounded(ofSize: 17, weight: .semibold)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: animated)
  }
  
  @IBAction func btnHome(_ sender: Any) {
    let nextMainController = MainViewController()
    self.navigationController?.pushViewController(nextMainController, animated: true)
  }
  
  
}
