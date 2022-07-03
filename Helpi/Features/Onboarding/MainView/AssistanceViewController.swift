//
//  AssistanceViewController.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 27/06/22.
//

import UIKit

class AssistanceViewController: UIViewController {

    @IBOutlet weak var titleLabel1: UILabel!
    @IBOutlet weak var titleLabel2: UILabel!
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var descText: UILabel!
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: true)
    navigationItem.hidesBackButton = true
    let rightBarButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(didTapRightBarButton))
    rightBarButton.tintColor = .white
    navigationItem.rightBarButtonItem = rightBarButton
  }

  @objc func didTapRightBarButton() {
    dismiss(animated: true)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
      
      titleLabel1.font = .rounded(ofSize: 90, weight: .black)
      titleLabel2.font = .rounded(ofSize: 60, weight: .semibold)
      descText.font = .rounded(ofSize: 18, weight: .medium)
      btnStart.titleLabel?.font = .rounded(ofSize: 17, weight: .semibold)
      

    // Do any additional setup after loading the view.
  }

  @IBAction func didTapStartButton(_ sender: Any) {
    let nextViewController = PersonalNoteViewController()
    navigationController?.pushViewController(nextViewController, animated: true)
  }
}
