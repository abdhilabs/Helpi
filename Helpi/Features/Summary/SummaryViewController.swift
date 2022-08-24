//
//  SummaryViewController.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 22/08/22.
//

import UIKit
import HealthKit

enum Summary: String {
  case heartRate = "Detak Jantung"
  case saturation = "Saturasi Oksigen"
  case elektro = "Elektrokardiogram"
}

class SummaryViewController: UIViewController {
  
  var healthStore: HKHealthStore?
  let heartRateUnit: HKUnit = HKUnit.count().unitDivided(by: .minute())
  
  @IBOutlet weak var tblSummary: UITableView!
  
  private let summaries: [Summary] = [.heartRate, .saturation, .elektro]
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.isHidden = true
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    healthStore = HKHealthStore()
    let sampleTypes = HKSampleType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!
    healthStore?.requestAuthorization(toShare: [sampleTypes], read: [sampleTypes], completion: { (success, error) in
      if (error != nil) {
        print(error!.localizedDescription)
      }
    })
    
    getSamples()
    setupViews()
  }
  
  private func setupViews() {
    tblSummary.register(UINib(nibName: String(describing: SummaryTableViewCell.self), bundle: nil), forCellReuseIdentifier: "Summary")
    tblSummary.delegate = self
    tblSummary.dataSource = self
  }
  
  func getSamples() {
    let heartrate = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)
    
    let sort = [
      NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
    ]
    
    let sampleQuery = HKSampleQuery(sampleType: heartrate!, predicate: nil, limit: 1, sortDescriptors: sort, resultsHandler: { [unowned self] (query, results, error) in
      if let results = results as? [HKQuantitySample]
      {
        let sample = results[0] as HKQuantitySample
        let value = sample.quantity.doubleValue(for: self.heartRateUnit)
        let rate = results[0]
        print(value, rate)
        self.updateHeartRate(samples: results)
      }
    });      healthStore?.execute(sampleQuery)
  }
  
  func updateHeartRate(samples: [HKSample]?) {
    guard let heartRateSamples = samples as? [HKQuantitySample] else {return}
    DispatchQueue.main.async {
      guard let sample = heartRateSamples.first else{return}
      let value = sample.quantity.doubleValue(for: self.heartRateUnit)
//      self.lblUnit.text = "\(String(UInt16(value))) Bpm"
      let date = sample.startDate
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
//      self.lblDate.text = dateFormatter.string(from: date)
    }
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
//      cell.lblUnit.text =
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
