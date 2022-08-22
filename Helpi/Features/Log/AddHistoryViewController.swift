//
//  AddHistoryViewController.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 22/08/22.
//

import UIKit

class AddHistoryViewController: UIViewController {

  @IBOutlet weak var viewTimeBackground: UIStackView!
  @IBOutlet weak var pickerTime: UIDatePicker!

  override func viewWillAppear(_ animated: Bool) {
    navigationItem.title = "Riwayat Baru"
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didTapCloseButton))
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapSaveButton))
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }

  private func setupViews() {
    viewTimeBackground.layer.cornerRadius = 10
    pickerTime.largeContentTitle = "Time"
  }

  @objc func didTapCloseButton() {
    dismiss(animated: true)
  }

  @objc func didTapSaveButton() {

  }

}
