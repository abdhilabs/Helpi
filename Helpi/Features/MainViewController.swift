//
//  MainViewController.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 23/06/22.
//

import UIKit

class MainViewController: UIViewController {

  @IBOutlet weak var viewHelpButton: UIView!

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: true)
    setNavigationBar()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    configureViews()
  }

  private func configureViews() {
    viewHelpButton.layer.cornerRadius = viewHelpButton.frame.size.width / 2
    viewHelpButton.clipsToBounds = true
    viewHelpButton.isUserInteractionEnabled = true
    viewHelpButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapHelpButton)))
  }

  @objc func didTapHelpButton() {
    let nextViewController = HelpViewController()
    let navigation = UINavigationController(rootViewController: nextViewController)
    navigation.modalPresentationStyle = .fullScreen
    present(navigation, animated: true)
  }

  override func leftNavigationBarButtonTapped(sender: UIBarButtonItem?) {
    let nextViewController = AddFriendViewController()
    let navigation = UINavigationController(rootViewController: nextViewController)
    present(navigation, animated: true)
  }
}
