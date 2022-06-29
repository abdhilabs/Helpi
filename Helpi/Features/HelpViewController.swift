//
//  HelpViewController.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 27/06/22.
//

import UIKit

class HelpViewController: UIViewController {

  @IBOutlet weak var imgProfileButton: UIImageView!
  @IBOutlet weak var lblAlertStarting: UILabel!
  @IBOutlet weak var viewHelpButton: UIView!
  @IBOutlet weak var lblHelpAndCount: UILabel!
  @IBOutlet weak var lblTapButton: UILabel!
  @IBOutlet weak var btnCancel: UIButton!

  var viewProgressBar: CircularProgressBarView!
  var timer: Timer?

  override func viewDidLoad() {
    super.viewDidLoad()
    configureViews()
  }


  private func configureViews() {
    viewHelpButton.layer.cornerRadius = viewHelpButton.frame.size.width / 2
    viewHelpButton.clipsToBounds = true
    viewHelpButton.isUserInteractionEnabled = true
    viewHelpButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(setViewTimerStart)))
  }

  @objc func setViewTimerStart() {
    viewHelpButton.isUserInteractionEnabled = false

    lblHelpAndCount.text = "00:05"
    var count = 5
    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
      count -= 1

      if count < 0 {
        self.timer?.invalidate()
        let nextViewController = AssistanceViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
      } else {
        self.lblHelpAndCount.text = "00:0\(count)"
      }
    }

    lblAlertStarting.isHidden = false

    lblHelpAndCount.textColor = #colorLiteral(red: 1, green: 0.1058823529, blue: 0.4196078431, alpha: 1)
    viewHelpButton.backgroundColor = .white

    lblTapButton.isHidden = true
    btnCancel.isHidden = false
  }

  private func setViewTimerStop() {
    lblAlertStarting.isHidden = true

    lblHelpAndCount.text = "Help!"
    lblHelpAndCount.textColor = .white
    viewHelpButton.backgroundColor = #colorLiteral(red: 1, green: 0.1058823529, blue: 0.4196078431, alpha: 1)

    lblTapButton.isHidden = false
    btnCancel.isHidden = true
  }

  @IBAction func didTapCancelButton(_ sender: Any) {
    viewHelpButton.isUserInteractionEnabled = true
    timer?.invalidate()
    setViewTimerStop()
  }
}
