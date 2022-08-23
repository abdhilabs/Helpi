//
//  LogViewController.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 21/08/22.
//

import UIKit
import FSCalendar

class LogViewController: UIViewController {

  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var viewCalendar: FSCalendar!
  @IBOutlet weak var constCalendarHeight: NSLayoutConstraint!
  @IBOutlet weak var viewContainerHistory: UIView!
  @IBOutlet weak var lblHistory: UILabel!
  @IBOutlet weak var tblHistory: UITableView!

  private let cloudKitService = CloudKitService()

  private var historyLogs: [HistoryLog] = []

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.isHidden = true
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    setupViews()
    fetchHistory()
  }

  private func setupViews() {
    lblTitle.font = .rounded(ofSize: 34, weight: .bold)
    lblHistory.font = .rounded(ofSize: 20, weight: .bold)

    tblHistory.delegate = self
    tblHistory.dataSource = self
    tblHistory.register(UINib(nibName: String(describing: HistoryLogTableViewCell.self), bundle: nil), forCellReuseIdentifier: "HistoryLog")

    viewContainerHistory.layer.cornerRadius = 30
    viewContainerHistory.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    viewContainerHistory.layer.shadowColor = UIColor.black.cgColor
    viewContainerHistory.layer.shadowOpacity = 0.25
    viewContainerHistory.layer.shadowOffset = .zero
    viewContainerHistory.layer.shadowRadius = 5

    setupCalendar()
  }

  private func setupCalendar() {
    viewCalendar.locale = .init(identifier: "id")
    viewCalendar.firstWeekday = 1
    viewCalendar.scrollDirection = .horizontal
    viewCalendar.scope = .month
    viewCalendar.delegate = self
    viewCalendar.dataSource = self

    viewCalendar.appearance.headerTitleFont = .rounded(ofSize: 20, weight: .bold)
    viewCalendar.appearance.headerTitleAlignment = .center
    viewCalendar.appearance.weekdayFont = .rounded(ofSize: 18, weight: .regular)
    viewCalendar.appearance.titleFont = .rounded(ofSize: 18, weight: .regular)
    viewCalendar.appearance.todayColor = .systemBlue
    viewCalendar.appearance.titleTodayColor = .white
    viewCalendar.appearance.titleDefaultColor = .black
    viewCalendar.appearance.headerTitleColor = #colorLiteral(red: 0.3147028089, green: 0.3147028089, blue: 0.3147028089, alpha: 1)
    viewCalendar.appearance.weekdayTextColor = .black
    viewCalendar.appearance.headerSeparatorColor = .none
    viewCalendar.appearance.selectionColor = .lightOrange
    viewCalendar.appearance.titleSelectionColor = .primaryOrange
    viewCalendar.placeholderType = .none
  }

  private func fetchHistory() {
    showHelpiLoading()
    cloudKitService.fetchLogHistory { [weak self] logs in
      self?.hideHelpiLoading()
      self?.historyLogs.append(contentsOf: logs.sorted { $0.date < $1.date })
      DispatchQueue.main.async {
        self?.viewCalendar.reloadData()
        self?.tblHistory.reloadData()
      }
    }
  }

}

extension LogViewController: FSCalendarDelegate, FSCalendarDataSource {

  func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
    constCalendarHeight.constant = bounds.height
    view.layoutIfNeeded()
  }

  func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
    print("Change to \(calendar.currentPage)")
  }

  func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
    let nextViewController = AddHistoryViewController()
    nextViewController.historyDate = date
    let navigation = UINavigationController(rootViewController: nextViewController)
    present(navigation, animated: true) {
      self.fetchHistory()
    }
  }

  func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at monthPosition: FSCalendarMonthPosition) {
    cell.eventIndicator.isHidden = false
    cell.eventIndicator.color = UIColor.primaryOrange
  }

  func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
    if historyLogs.contains(where: { $0.date == date.string() }) {
      return 1
    }

    return 0
  }
}

extension LogViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return historyLogs.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryLog", for: indexPath) as? HistoryLogTableViewCell else {
      return UITableViewCell()
    }
    let dateLogs = historyLogs[indexPath.row].date.split(separator: "-")
    cell.lblDay.text = "\(dateLogs[dateLogs.endIndex - 1])"
    cell.lblTitle.text = historyLogs[indexPath.row].symptom
    cell.lblTime.text = historyLogs[indexPath.row].time
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }

}
