//
//  HomeTabBarViewController.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 19/08/22.
//

import UIKit

class HomeTabBarViewController: UITabBarController, UITabBarControllerDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()
    configureTabBar()
  }

  private func configureTabBar() {
    tabBar.isTranslucent = false
    tabBar.barTintColor = .white
    tabBar.tintColor = .white

    delegate = self

    let alertTab = createTabController(vc: EmergencyViewController(), title: "Alert", active: UIImage.iconAlertActive, inactive: UIImage.iconAlert)
    let logTab = createTabController(vc: LogViewController(), title: "Log", active: UIImage.iconLogActive, inactive: UIImage.iconLog)
    let summaryTab = createTabController(vc: SummaryViewController(), title: "Summary", active: UIImage.iconSummaryActive, inactive: UIImage.iconSummary)
    let moreTab = createTabController(vc: SettingViewController(), title: "More", active: UIImage.iconMoreActive, inactive: UIImage.iconMore)

    viewControllers = [alertTab, logTab, summaryTab, moreTab]
  }

  private func createTabController(vc: UIViewController, title: String, active: UIImage, inactive: UIImage) -> UINavigationController {
    let viewController = vc
    let tabController = UINavigationController(rootViewController: viewController)
    tabController.tabBarItem.image = inactive.withRenderingMode(.alwaysOriginal)
    tabController.tabBarItem.selectedImage = active.withRenderingMode(.alwaysOriginal)
    tabController.tabBarItem.title = title
    tabController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -4.0)

    if #available(iOS 13.0, *) {
      let tabBarAppearance = UITabBarAppearance()
      tabBarAppearance.backgroundColor = .white
      tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.primaryOrange, NSAttributedString.Key.font: UIFont.font(type: .sfRegular, size: 10)]
      tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.font(type: .sfRegular, size: 10)]
      tabBar.standardAppearance = tabBarAppearance
      if #available(iOS 15.0, *) {
        tabBar.scrollEdgeAppearance = tabBarAppearance
      }
    } else {
      tabController.tabBarItem.setTitleTextAttributes(
        [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.font(type: .sfRegular, size: 10)],
        for: .normal
      )
      tabController.tabBarItem.setTitleTextAttributes(
        [NSAttributedString.Key.foregroundColor: UIColor.primaryOrange, NSAttributedString.Key.font: UIFont.font(type: .sfRegular, size: 10)],
        for: .selected
      )
    }

    return tabController
  }
}
