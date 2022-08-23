//
//  HelpiLoadingViewController.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 23/08/22.
//

import UIKit
import Lottie
import Combine

class HelpiLoadingViewController: UIViewController {

  @IBOutlet weak var viewContainer: UIView!
  @IBOutlet weak var viewAnimation: AnimationView!
  @IBOutlet weak var lblLoading: UILabel!

  private let dismissLoading = createPublisher(for: Notifications.dismissLoading)
  private var cancellables = Set<AnyCancellable>()

  override func viewDidLoad() {
    super.viewDidLoad()

    viewContainer.layer.cornerRadius = 10

    viewAnimation.contentMode = .scaleAspectFill
    viewAnimation.loopMode = .loop
    viewAnimation.animationSpeed = 0.5
    viewAnimation.play()

    lblLoading.font = .rounded(ofSize: 20, weight: .bold)

    dismissLoading.sink { [weak self] _ in
      DispatchQueue.main.async {
        self?.dismiss(animated: true)
      }
    }.store(in: &cancellables)
  }

}
