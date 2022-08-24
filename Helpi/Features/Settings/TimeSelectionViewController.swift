//
//  MedicineReminderViewController.swift
//  Helpi
//
//  Created by Miftakhul Huda on 23/08/22.
//

import UIKit

class TimeSelectionViewController: UIViewController {
  
  @IBOutlet weak var dpTimePicker: UIDatePicker!
  @IBOutlet weak var tblRepeat: UITableView!
  
  let cellTitle : [String] = ["Ulangi"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    dpTimePicker.locale = .current
    dpTimePicker.datePickerMode = .time
    dpTimePicker.preferredDatePickerStyle = .wheels
    dpTimePicker.addTarget(self, action: #selector(dateSelected), for: .valueChanged)
    
    tblRepeat.delegate = self
    tblRepeat.dataSource = self
    tblRepeat.register(UINib(nibName: "TimeSelectionTableViewCell", bundle: nil), forCellReuseIdentifier: "TimeSelectionTableViewCell")
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: nil)
  }
  
  @objc
  func dateSelected() {
    let dateFormatter = DateFormatter()
    dateFormatter.timeStyle = .short
    let time = dateFormatter.string(from: dpTimePicker.date)
    print(time)
  }
}

extension TimeSelectionViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "TimeSelectionTableViewCell", for: indexPath) as? TimeSelectionTableViewCell else {
      return UITableViewCell()
    }
    
    cell.lblCellTitle.text = cellTitle[indexPath.row]
    cell.accessoryType = .disclosureIndicator
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    onClickView()
  }
  
  @objc func onClickView(){
    let viewControllerToPresent = DaySelectionViewController()
    if let sheet = viewControllerToPresent.sheetPresentationController {
      sheet.detents = [.large()]
      sheet.largestUndimmedDetentIdentifier = .medium
      sheet.prefersScrollingExpandsWhenScrolledToEdge = false
      sheet.prefersEdgeAttachedInCompactHeight = true
      sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
    }
    present(viewControllerToPresent, animated: true, completion: nil)
  }
}
