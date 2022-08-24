//
//  DaySelectionViewController.swift
//  Helpi
//
//  Created by Miftakhul Huda on 23/08/22.
//

import UIKit

class DaySelectionViewController: UIViewController {
  
  @IBOutlet weak var tblDaySelection: UITableView!
  
  struct DayData {
    let dayTitle : String
    let isChecked : Bool
  }
  
  let listOfDay : [DayData] = [
    DayData(dayTitle: "Setiap Senin", isChecked: false),
    DayData(dayTitle: "Setiap Selasa", isChecked: false),
    DayData(dayTitle: "Setiap Rabu", isChecked: false),
    DayData(dayTitle: "Setiap Kamis", isChecked: false),
    DayData(dayTitle: "Setiap Jumat", isChecked: false),
    DayData(dayTitle: "Setiap Sabtu", isChecked: false),
    DayData(dayTitle: "Setiap Minggu", isChecked: false),
  ]
  
  var isChecked : [Bool] = [false, false, false, false, false, false, false]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tblDaySelection.delegate = self
    tblDaySelection.dataSource = self
    tblDaySelection.register(UINib(nibName: "DaySelectionTableViewCell", bundle: nil), forCellReuseIdentifier: "DaySelectionTableViewCell")
  }
  
}

extension DaySelectionViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return listOfDay.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "DaySelectionTableViewCell", for: indexPath) as? DaySelectionTableViewCell else {
      return UITableViewCell()
    }
    
    let dayData = listOfDay[indexPath.row]
    
    cell.lblRepeatDay.text = dayData.dayTitle
    cell.accessoryType = .none
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let selectedRow = indexPath.row
    
    switch selectedRow {
    case 0:
      if isChecked[selectedRow] == false {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        isChecked[selectedRow] = true
      }else if isChecked[selectedRow] == true {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        isChecked[selectedRow] = false
      }
      
    case 1:
      if isChecked[selectedRow] == false {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        isChecked[selectedRow] = true
      }else if isChecked[selectedRow] == true {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        isChecked[selectedRow] = false
      }
      
    case 2:
      if isChecked[selectedRow] == false {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        isChecked[selectedRow] = true
      }else if isChecked[selectedRow] == true {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        isChecked[selectedRow] = false
      }
      
    case 3:
      if isChecked[selectedRow] == false {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        isChecked[selectedRow] = true
      }else if isChecked[selectedRow] == true {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        isChecked[selectedRow] = false
      }
      
    case 4:
      if isChecked[selectedRow] == false {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        isChecked[selectedRow] = true
      }else if isChecked[selectedRow] == true {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        isChecked[selectedRow] = false
      }
      
    case 5:
      if isChecked[selectedRow] == false {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        isChecked[selectedRow] = true
      }else if isChecked[selectedRow] == true {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        isChecked[selectedRow] = false
      }
      
    case 6:
      if isChecked[selectedRow] == false {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        isChecked[selectedRow] = true
      }else if isChecked[selectedRow] == true {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        isChecked[selectedRow] = false
      }
      
    default:
      print("Error Code")
    }
  }
}
