//
//  PickerViewPresenter.swift
//  Helpi
//
//  Created by Miftakhul Huda on 22/08/22.
//

import Foundation
import UIKit
import SwiftUI

struct PickerData {
  let label : String
  let value : Int
}

class PickerViewPresenter: UITextField, UIPickerViewDataSource, UIPickerViewDelegate {
  private lazy var doneToolbar: UIToolbar = {
    let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
    
    let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
    
    let items = [flexSpace, doneButton]
    toolbar.items = items
    toolbar.sizeToFit()
    
    return toolbar
  }()
  
  private lazy var pickerView: UIPickerView = {
    let pickerView = UIPickerView()
    pickerView.dataSource = self
    pickerView.delegate = self
    return pickerView
  }()
  
  
  var pickerData: [PickerData] = (1...60).map{PickerData(label: "\($0) Detik", value: $0)}
  
  var didSelectItem: ((PickerData) -> Void)?
  
  private var selectedItem: PickerData?
  
  init() {
    super.init(frame: .zero)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {
    inputView = pickerView
    inputAccessoryView = doneToolbar
  }
  
  @objc private func doneButtonTapped() {
    if let selectedItem = selectedItem {
      didSelectItem?(selectedItem)
    }
    resignFirstResponder()
  }
  
  func showPicker() {
    becomeFirstResponder()
  }
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return pickerData.count
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return pickerData[row].label
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    selectedItem = pickerData[row]
  }
}
