//
//  HelpViewController.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 27/06/22.
//

import UIKit

class HelpViewController: UIViewController {
  
  @IBOutlet weak var titleLabel: UILabel!
  
  @IBOutlet weak var descLabel: UILabel!
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
    
    titleLabel.font = .rounded(ofSize: 36, weight: .bold)
    descLabel.font = .rounded(ofSize: 18, weight: .regular)
    btnCancel.layer.borderWidth = 1
    btnCancel.layer.borderColor = #colorLiteral(red: 1, green: 0.1843137255, blue: 0.02745098039, alpha: 1)
    btnCancel.titleLabel?.font = .rounded(ofSize: 17, weight: .semibold)
    btnCancel.layer.cornerRadius = 10
    btnCancel.dropShadow()
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
        //              let url = URL(string: "shortcuts://run-shortcut?name=Send%20Helpi&input=text&text=test-shortcut-automatically")
        //        let url = URL(string: "shortcuts://x-callback-url/run-shortcut?name=Send%20Helpi&input=text&text=test-shortcut-automatically&x-success=helpiapp://")
        //        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        
        self.timer?.invalidate()
        let nextViewController = AssistanceViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
      } else {
        self.lblHelpAndCount.text = "00:0\(count)"
      }
    }
    
    lblHelpAndCount.textColor = .white
    viewHelpButton.backgroundColor = #colorLiteral(red: 1, green: 0.7568627451, blue: 0.7098039216, alpha: 1)
  }
  
  @IBAction func didTapCancelButton(_ sender: Any) {
    timer?.invalidate()
    dismiss(animated: true)
  }
}
