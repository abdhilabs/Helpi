//
//  AddHistoryViewController.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 22/08/22.
//

import UIKit

class AddHistoryViewController: UIViewController {

  @IBOutlet weak var txtSymptom: UITextField!
  @IBOutlet weak var viewTimeBackground: UIStackView!
  @IBOutlet weak var pickerTime: UIDatePicker!
  @IBOutlet weak var txtAdditionalInfo: UITextField!

  private let cloudKitService = CloudKitService()

  var historyDate: Date = .now
  var onDismiss: (() -> Void)? = nil

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
    addTapGestureToHideKeyboard()

    viewTimeBackground.layer.cornerRadius = 10
    pickerTime.largeContentTitle = "Time"
  }

  @objc func didTapCloseButton() {
    dismiss(animated: true)
  }

  @objc func didTapSaveButton() {

    guard let additionalInfo = txtAdditionalInfo.text, let syptom = txtSymptom.text else { return }
    let time = pickerTime.date.string(format: "HH:mm a")

    showLoading()
    cloudKitService.saveLogHistory(with: .init(additionalInfo: additionalInfo, symptom: syptom, time: time, date: historyDate.string())) { [weak self] isSuccess, isRegistered in
      if isSuccess {
        self?.hideLoading()
        DispatchQueue.main.async {
          self?.dismiss(animated: true) {
            self?.onDismiss?()
          }
        }
      } else {
        self?.hideLoading()
        if !isRegistered {
          let message = """
                            Sign in to your iCloud account to write records.
                            On the Home screen, launch Settings, tap Sign in to your
                            iPhone/iPad, and enter your Apple ID. Turn iCloud Drive on.
                            """
          let alert = UIAlertController(
            title: "Sign in to iCloud",
            message: message,
            preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "OK", style: .cancel))
          self?.present(alert, animated: true)
        } else {
          
        }
      }
    }
  }

}
