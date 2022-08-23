//
//  FirstAidScreen.swift
//  Helpi
//
//  Created by PUTRI RAHMADEWI on 29/06/22.
//

import UIKit

class FirstAidViewController: UIViewController {

  @IBOutlet weak var tblGuide: UITableView!
  @IBOutlet weak var btnEmergency: UIButton!
  @IBOutlet weak var btnDone: UIButton!

  private var guides: [Guide] = []

  var emergencyPhonePrimary = ""
  var emergencyPhoneSecondary = ""

  var firstGuideDescription: NSMutableAttributedString {
    let attributedString = NSMutableAttributedString(string: "Pastikan saya aman, tidak di tempat ramai dan banyak udara segar")
    attributedString.addAttributes([
      .font: UIFont.systemFont(ofSize: 17, weight: .semibold)
    ], range: NSRange(location: 14, length: 50))
    return attributedString
  }

  var secondaryGuideDescription: NSMutableAttributedString {
    let attributedString = NSMutableAttributedString(string: "Baringkan dengan kaki lebih tinggi dari kepala\nLihat respon saya, dengan memanggil saya")
    attributedString.addAttributes([
      .font: UIFont.systemFont(ofSize: 17, weight: .semibold)
    ], range: NSRange(location: 0, length: 10))

    attributedString.addAttributes([
      .font: UIFont.systemFont(ofSize: 17, weight: .semibold)
    ], range: NSRange(location: 47, length: 17))
    return attributedString
  }

  var thirdGuideDescription: NSMutableAttributedString {
    let attributedString = NSMutableAttributedString(string: "Jika kondisi saya memburuk,  segera hubungi kontak darurat atau nomor darurat terdekat")
    attributedString.addAttributes([
      .font: UIFont.systemFont(ofSize: 17, weight: .semibold)
    ], range: NSRange(location: 0, length: 12))

    attributedString.addAttributes([
      .font: UIFont.systemFont(ofSize: 17, weight: .semibold)
    ], range: NSRange(location: 18, length: 8))

    attributedString.addAttributes([
      .font: UIFont.systemFont(ofSize: 17, weight: .semibold)
    ], range: NSRange(location: 44, length: 42))
    return attributedString
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.isHidden = true
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    configureViews()
  }

  private func configureViews() {
    guides = [
      .init(title: "Pastikan Keadaan Sekitar Aman", description: firstGuideDescription),
      .init(title: "Baringkan Saya", description: secondaryGuideDescription),
      .init(title: "Panggilan Darurat", description: thirdGuideDescription),
    ]

    tblGuide.register(UINib(nibName: String(describing: GuideTableViewCell.self), bundle: nil), forCellReuseIdentifier: "GuideCell")
    tblGuide.dataSource = self


    btnEmergency.layer.cornerRadius = 10
    btnEmergency.layer.borderWidth = 1
    btnEmergency.layer.borderColor = #colorLiteral(red: 1, green: 0.1843137255, blue: 0.02745098039, alpha: 1)

    btnDone.layer.cornerRadius = 10
  }

  @IBAction func didTapEmergencyButton(_ sender: Any) {
    showActionsheet()
  }

  @IBAction func didTapDoneButton(_ sender: Any) {
    showAlert()
  }

  func showAlert(){
    let alert = UIAlertController(title: "Am I safe?", message: "If I am still unconscious, please call my emergency contact or call nearby emergency number to get help. \n\n Tap Done if I am awake or after emergency comes.", preferredStyle: .alert)

    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))

    alert.addAction(UIAlertAction(title: "Done", style: .destructive , handler: {  action in
      let nextDoneController = DoneViewController()
      self.navigationController?.pushViewController(nextDoneController, animated: true)
    }))
    present(alert, animated: true)
  }

  func showActionsheet(){
    let actionSheet = UIAlertController(title: "Make a call", message: "Kamu bisa memilih contact emergency mana.", preferredStyle: .actionSheet)
    actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    actionSheet.addAction(UIAlertAction(title: "Emergency Contact 1", style: .default , handler: { action in
      if let urlDial = URL(string: "tel://\(self.emergencyPhonePrimary)") {
        if UIApplication.shared.canOpenURL(urlDial) {
          UIApplication.shared.open(urlDial)
        }
      }
    }))
    actionSheet.addAction(UIAlertAction(title: "Emergency Contact 2", style: .default , handler: { action in
      if let urlDial = URL(string: "tel://\(self.emergencyPhoneSecondary)") {
        if UIApplication.shared.canOpenURL(urlDial) {
          UIApplication.shared.open(urlDial)
        }
      }
    }))

    present(actionSheet, animated: true)
  }
}

extension FirstAidViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return guides.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "GuideCell") as? GuideTableViewCell else {
      return UITableViewCell()
    }
    cell.lblNumber.text = String(indexPath.row + 1)
    cell.configureView(guide: guides[indexPath.row])
    return cell
  }
}
