//
//  ReminderScheduleViewController.swift
//  Helpi
//
//  Created by Miftakhul Huda on 23/08/22.
//

import UIKit

class ReminderScheduleViewController: UIViewController {
  
  @IBOutlet weak var tblSchedule: UITableView!
  
  struct CellContent {
    let time : String
    let description : String
  }
  
  var cellData : [CellContent] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tblSchedule.delegate = self
    tblSchedule.dataSource = self
    tblSchedule.register(UINib(nibName: "ReminderScheduleTableViewCell", bundle: nil), forCellReuseIdentifier: "ReminderScheduleTableViewCell")
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onClickAdd))
  }
  
}

extension ReminderScheduleViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cellData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReminderScheduleTableViewCell", for: indexPath) as? ReminderScheduleTableViewCell else {
      return UITableViewCell()
    }
    
    let cellContent = cellData[indexPath.row]
    
    let switchView = UISwitch(frame: .zero)
    switchView.setOn(false, animated: true)
    switchView.tag = indexPath.row // for detect which row switch Changed
    switchView.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
    
    cell.lblTime.text = cellContent.time
    cell.lblDescription.text = cellContent.description
    cell.accessoryView = switchView
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
  
  @objc func switchChanged(_ sender : UISwitch!){
    
    print("table row switch Changed \(sender.tag)")
    print("The switch is \(sender.isOn ? "ON" : "OFF")")
  }
  
  @objc func onClickAdd() {
    self.navigationController?.pushViewController(TimeSelectionViewController(nibName: "TimeSelectionViewController", bundle: nil), animated: true)
  }
}
