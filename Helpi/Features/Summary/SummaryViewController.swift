//
//  SummaryViewController.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 22/08/22.
//

import UIKit

enum Summary: String {
  case heartRate = "Detak Jantung"
  case saturation = "Saturasi Oksigen"
  case elektro = "Elektrokardiogram"
}

class SummaryViewController: UIViewController {

  @IBOutlet weak var tblSummary: UITableView!

  private let summaries: [Summary] = [.heartRate, .saturation, .elektro]

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.isHidden = true
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    setupViews()
  }

  private func setupViews() {
    tblSummary.register(UINib(nibName: String(describing: SummaryTableViewCell.self), bundle: nil), forCellReuseIdentifier: "Summary")
    tblSummary.delegate = self
    tblSummary.dataSource = self
  }
}

extension SummaryViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return summaries.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "Summary", for: indexPath) as? SummaryTableViewCell else {
      return UITableViewCell()
    }

    cell.lblTitle.text = summaries[indexPath.row].rawValue
    switch summaries[indexPath.row] {
    case .heartRate:
      cell.imgUnit.image = .iconHeartCardiogram
    case .saturation:
      cell.imgUnit.image = .iconSaturation
    case .elektro:
      cell.imgUnit.image = .iconElectrocardiogram
    }

    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)

    let nextViewController = DetailSummaryViewController()
    nextViewController.title = summaries[indexPath.row].rawValue
    let navigation = UINavigationController(rootViewController: nextViewController)
    present(navigation, animated: true)
  }
}
