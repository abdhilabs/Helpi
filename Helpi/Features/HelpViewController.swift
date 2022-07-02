//
//  HelpViewController.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 27/06/22.
//

import UIKit

class HelpViewController: UIViewController {

  @IBOutlet weak var lblAlertStarting: UILabel!
  @IBOutlet weak var viewHelpButton: UIView!
  @IBOutlet weak var lblHelpAndCount: UILabel!
  @IBOutlet weak var btnCancel: UIButton!

  var viewProgressBar: CircularProgressBarView!
  var timer: Timer?

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: true)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    configureViews()
  }


  private func configureViews() {
    viewHelpButton.layer.cornerRadius = viewHelpButton.frame.size.width / 2
    viewHelpButton.clipsToBounds = true

    setViewTimerStart()
  }

  private func setViewTimerStart() {
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

  }

  @IBAction func didTapCancelButton(_ sender: Any) {
    timer?.invalidate()
    dismiss(animated: true)
  }
}
