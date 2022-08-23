//
//  TimeSettingViewController.swift
//  Helpi
//
//  Created by Miftakhul Huda on 19/08/22.
//

import UIKit

class TimeSettingViewController: UIViewController {
  
  @IBOutlet weak var tblTimeSetting: UITableView!
  
  let titlePerRow = ["Pengatur Waktu", "Jeda Waktu"]
  
  private var selectedItem: PickerData?
  
  private lazy var pickerViewPresenter: PickerViewPresenter = {
    let pickerViewPresenter = PickerViewPresenter()
    pickerViewPresenter.didSelectItem = { [weak self] item in
      self?.selectedItem = item
    }
    return pickerViewPresenter
  }()

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tblTimeSetting.delegate = self
    tblTimeSetting.dataSource = self
    tblTimeSetting.register(UINib(nibName: "TimeSettingTableViewCell", bundle: nil), forCellReuseIdentifier: "TimeSettingTableViewCell")
    
    view.addSubview(pickerViewPresenter)
  }
}

extension TimeSettingViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return titlePerRow.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "TimeSettingTableViewCell", for: indexPath) as? TimeSettingTableViewCell else {
      return UITableViewCell()
    }
    
    cell.lblTitle.text = titlePerRow[indexPath.row]
    
    let switchView = UISwitch(frame: .zero)
    switchView.setOn(false, animated: true)
    switchView.tag = indexPath.row // for detect which row switch Changed
    switchView.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
    
    if indexPath.row == 0 {
      cell.lblValue.isHidden = true
      cell.accessoryView = switchView
    } else {
      cell.accessoryType = .disclosureIndicator
    }
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let selectedIndex = indexPath.row
    
    switch selectedIndex {
    case 0:
      print("nothing happened")
    case 1:
      buttonTapped()
    default:
      print("Something wrong with the code")
    }
  }
  
  @objc func switchChanged(_ sender : UISwitch!){
    
    print("table row switch Changed \(sender.tag)")
    print("The switch is \(sender.isOn ? "ON" : "OFF")")
  }
  
  @objc private func buttonTapped() {
    pickerViewPresenter.showPicker()
  }
}
