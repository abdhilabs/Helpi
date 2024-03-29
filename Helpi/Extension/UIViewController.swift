//
//  UIViewController.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 30/06/22.
//

import UIKit
import SVProgressHUD

extension UIViewController {
  
  func setNavigationBar() {
    navigationItem.hidesBackButton = true
    navigationItem.leftBarButtonItem = createLeftButton(color: .white, image: UIImage(systemName: "person.badge.plus")!)
    //    navigationItem.rightBarButtonItem = createRightButton(color: .white, image: UIImage(systemName: "line.3.horizontal")!)
  }
  
  private func createLeftButton(color: UIColor, image: UIImage) -> UIBarButtonItem {
    let backButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(self.leftNavigationBarButtonTapped(sender:)))
    backButton.tintColor = color
    backButton.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 30)
    return backButton
  }
  
  private func createRightButton(color: UIColor, image: UIImage) -> UIBarButtonItem {
    let backButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(self.rightNavigationBarButtonTapped(sender:)))
    backButton.tintColor = color
    backButton.imageInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
    return backButton
  }
  
  func addTapGestureToHideKeyboard() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
  
  @objc func hideKeyboard() {
    view.endEditing(true)
  }
  
  func showGeneralAlert(title: String = "Peringatan", message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .default))
    self.present(alert, animated: true)
  }

  func showLoading() {
    SVProgressHUD.show()
  }

  func hideLoading() {
    SVProgressHUD.dismiss()
  }
}

protocol NavigationBarButtonHandler {
  func leftNavigationBarButtonTapped(sender: UIBarButtonItem?)
  func rightNavigationBarButtonTapped(sender: UIBarButtonItem?)
}

extension UIViewController: NavigationBarButtonHandler {
  @objc func rightNavigationBarButtonTapped(sender: UIBarButtonItem?) {
  }
  
  @objc func leftNavigationBarButtonTapped(sender: UIBarButtonItem?) {
  }
}
