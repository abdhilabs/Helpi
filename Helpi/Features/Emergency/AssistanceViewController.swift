//
//  AssistanceViewController.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 27/06/22.
//

import UIKit
import AVFoundation

class AssistanceViewController: UIViewController {
  
  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var lblSubtitle: UILabel!
  @IBOutlet weak var lblDescription: UILabel!
  @IBOutlet weak var btnStart: UIButton!

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: true)
    navigationItem.hidesBackButton = true
    let rightBarButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(didTapRightBarButton))
    rightBarButton.tintColor = .white
    navigationItem.rightBarButtonItem = rightBarButton
  }
  
  @objc func didTapRightBarButton() {
    AVService.shared.audioPlayer?.stop()
    dismiss(animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    AVService.shared.playSoundTimer()
    
    lblTitle.font = .rounded(ofSize: 90, weight: .black)
    lblSubtitle.font = .rounded(ofSize: 60, weight: .semibold)
    lblDescription.font = .rounded(ofSize: 18, weight: .medium)
    btnStart.titleLabel?.font = .rounded(ofSize: 17, weight: .semibold)
    btnStart.layer.cornerRadius = 10
    btnStart.dropShadow()

    let attributedString = NSMutableAttributedString(string: "Jangan Panik\nKetuk tombol “Mulai Bantuan” untuk menolong")
    attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 17, weight: .bold), range: NSRange(location: 27, length: 15))
    lblDescription.attributedText = attributedString
  }
  
  @IBAction func didTapStartButton(_ sender: Any) {
    AVService.shared.audioPlayer?.stop()
    
    let nextViewController = PersonalNoteViewController()
    navigationController?.pushViewController(nextViewController, animated: true)
  }
}
