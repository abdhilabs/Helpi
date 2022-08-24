//
//  OnboardViewController.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 26/06/22.
//

import UIKit
import HealthKit

struct Onboarding {
  let image: String
  let title: String
  let description: String
}

class OnboardViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
  
  private let authorizeHealthKitSection = 2
  private var healthStore: HKHealthStore!
  
  private func authorizeHealthKit() {
    healthStore = HKHealthStore()
    let sampleTypes = HKSampleType.quantityType(forIdentifier: .heartRate)!
    healthStore?.requestAuthorization(toShare: [], read: [sampleTypes], completion: { (success, error) in
      if success {
        DispatchQueue.main.async {
          self.navigateToProfileSetup()
        }
      }
    })
  }
  
  //Set IBoutlet
  @IBOutlet weak var colOnboarding: UICollectionView!
  @IBOutlet weak var pgOnboarding: UIPageControl!
  @IBOutlet weak var btnConnectHealth: UIButton!
  @IBOutlet weak var btnSkip: UIButton!

  let onboarding: [Onboarding] = [
    Onboarding(image: "onboarding_one", title: "Peringatkan Sekitar", description: "Helpi akan memperingatkan orang disekitar Anda dan memandu penolong untuk memberi Anda pertolongan pertama."),
    Onboarding(image: "onboarding_two", title: "Pemberitahuan Kontak Darurat", description: "Helpi akan memberi tahu kontak darurat Anda saat Anda dalam kondisi darurat dan atau akan pingsan."),
    Onboarding(image: "onboarding_three", title: "Mencatat Aritmia", description: "Helpi dapat membantu Anda mencatat saat Anda merasakan gejala aritmia."),
    Onboarding(image: "onboarding_four", title: "Pengingat EKG & Obat", description: "Helpi dapat membantu Anda untuk mengingatkan Anda untuk mengukur EKG Anda dan mengkonsumsi obat Anda."),
    Onboarding(image: "onboarding_five", title: "Akses Health App", description: "Helpi memerlukan izin untuk membaca/mengakses data dari Apple Health untuk mengelola catatan kesehatan Anda. \n\n Ketuk tombol Hubungkan dengan Health App” untuk memberi kami izin membaca data yang diperlukan.")
  ]

  override func viewDidLoad() {
    super.viewDidLoad()
    btnSkip.titleLabel?.font = .rounded(ofSize: 17, weight: .regular)
    btnConnectHealth.titleLabel?.font = .rounded(ofSize: 17, weight: .semibold)
    btnConnectHealth.layer.cornerRadius = 10
    btnConnectHealth.dropShadow()
    
    //Set Collection View
    colOnboarding.backgroundColor = .white
    colOnboarding.dataSource = self
    colOnboarding.delegate = self
    colOnboarding.register(UINib(nibName: OnboardingCollectionViewCell.identifier, bundle: Bundle.main),
                           forCellWithReuseIdentifier: "OnboardingCollectionViewCell")
    
    // set the number of pages to the number of Onboarding Screens
    pgOnboarding.numberOfPages = self.onboarding.count
    
    btnConnectHealth.backgroundColor = #colorLiteral(red: 1, green: 0.1843137255, blue: 0.02745098039, alpha: 0.8980392157)
  }
  
  
  @IBAction func pageChanged(_ sender: Any) {
    btnConnectHealth.titleLabel?.font = .rounded(ofSize: 17, weight: .semibold)
    let pc = sender as! UIPageControl
    
    // scrolling the collectionView to the selected page
    colOnboarding.scrollToItem(at: IndexPath(item: pc.currentPage, section: 0), at: .centeredHorizontally, animated: true)
  }
  
  @IBAction func skipBtn(_ sender: Any) {
    navigateToProfileSetup()
  }
  
  func navigateToProfileSetup() {
    SessionManager.shared.setShowOnboard()
    let nextContactController = LoginViewController()
    self.navigationController?.pushViewController(nextContactController, animated: true)
  }
  
  @IBAction func btnConnectHealth(_ sender: Any) {
    btnConnectHealth.titleLabel?.font = .rounded(ofSize: 17, weight: .semibold)
    switch pgOnboarding.currentPage {
    case 3:
      btnConnectHealth.setTitle("Connect with Health App", for: .normal)
    case 4:
      authorizeHealthKit()
    default:
      break
    }
    
    btnConnectHealth.titleLabel?.font = .rounded(ofSize: 17, weight: .semibold)
    pgOnboarding.currentPage = pgOnboarding.currentPage + 1
    let i = IndexPath(item: pgOnboarding.currentPage, section: 0)
    colOnboarding.scrollToItem(at: i as IndexPath, at: .centeredHorizontally, animated: true)
  }
  
  // MARK:- collectionView dataSource & collectionView FlowLayout delegates
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return onboarding.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier,
                                                  for: indexPath) as! OnboardingCollectionViewCell
    
    // function for configuring the cell, defined in the Custom cell class
    cell.configureCell(onboarding: onboarding[indexPath.item])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: self.colOnboarding.frame.width, height: self.colOnboarding.frame.height)
  }
  
  // to update the UIPageControl
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    pgOnboarding.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
  }
}
