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
  @IBOutlet weak var lblHistory: UILabel!
  @IBOutlet weak var tblHistory: UITableView!

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.isHidden = true
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    setupViews()
  }

  private func setupViews() {
    lblTitle.font = .font(type: .sfBold, size: 34) 
    lblHistory.font = .font(type: .sfBold, size: 20)

    tblHistory.delegate = self
    tblHistory.dataSource = self
    tblHistory.register(UINib(nibName: String(describing: HistoryLogTableViewCell.self), bundle: nil), forCellReuseIdentifier: "HistoryLog")

    setupCalendar()
  }

  private func setupCalendar() {
    viewCalendar.locale = .current
    viewCalendar.firstWeekday = 1
    viewCalendar.scrollDirection = .horizontal
    viewCalendar.scope = .month
    viewCalendar.delegate = self
    viewCalendar.dataSource = self

    viewCalendar.appearance.headerTitleFont = UIFont.font(type: .sfBold, size: 20)
    viewCalendar.appearance.headerTitleAlignment = .center
    viewCalendar.appearance.weekdayFont = UIFont.font(type: .sfRegular, size: 18)
    viewCalendar.appearance.titleFont = UIFont.font(type: .sfRegular, size: 18)
    viewCalendar.appearance.todayColor = .systemBlue
    viewCalendar.appearance.titleTodayColor = .white
    viewCalendar.appearance.titleDefaultColor = .black
    viewCalendar.appearance.headerTitleColor = .black
    viewCalendar.appearance.weekdayTextColor = .black
    viewCalendar.appearance.headerSeparatorColor = .none
    viewCalendar.appearance.selectionColor = .lightOrange
    viewCalendar.appearance.titleSelectionColor = .primaryOrange
    viewCalendar.placeholderType = .none
  }

}

extension LogViewController: FSCalendarDelegate, FSCalendarDataSource {

  func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
    constCalendarHeight.constant = bounds.height
    view.layoutIfNeeded()
  }

  func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
    let nextViewController = AddHistoryViewController()
    let navigation = UINavigationController(rootViewController: nextViewController)
    present(navigation, animated: true)
  }
}

extension LogViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    3
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryLog", for: indexPath) as? HistoryLogTableViewCell else {
      return UITableViewCell()
    }
    cell.lblTitle.text = "Pusying..."
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }

}
