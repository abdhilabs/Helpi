//
//  OnboardViewController.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 26/06/22.
//

import UIKit

class OnboardViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    private let authorizeHealthKitSection = 2
    
    private func authorizeHealthKit() {
        HealthKitSetupAssistant.authorizeHealthKit { (authorized, error) in
            guard authorized else {
                let baseMessage = "HealthKit Authorization Failed"
                if let error = error {
                    print("\(baseMessage). Reason: \(error.localizedDescription)")
                } else {
                    print(baseMessage)
                }
                return
            }
            print("Succes")
        }
    }
    
    //Set IBoutlet
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var btnConnectHealth: UIButton!
    @IBOutlet weak var btnSkip: UIButton!
    
    let onboarding: [Onboarding] = [
      Onboarding(animationName: "notif", title: "Alert Helper", description: "Helpi will alert your surroundings and immediately send notification to your helper when you are about to faint."),
      Onboarding(animationName: "firstaid", title: "First Aid", description: "Helpi will show first responders how to give you first aid and how to reach your emergency contact."),
      Onboarding(animationName: "medical", title: "Health App Access", description: "Helpi needs permission to read/access data from Apple Health in order to manage your health record.Tap the button below to grant permission to read the necessary data.")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnSkip.titleLabel?.font = .rounded(ofSize: 17, weight: .semibold)
        btnConnectHealth.layer.cornerRadius = 20
        
        //Set Collection View
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: OnboardingCollectionViewCell.identifier, bundle: Bundle.main),
                                forCellWithReuseIdentifier: "OnboardingCollectionViewCell")
        
        // set the number of pages to the number of Onboarding Screens
        pageControl.numberOfPages = self.onboarding.count
        
        btnConnectHealth.backgroundColor = #colorLiteral(red: 0.2392156863, green: 0.2352941176, blue: 0.5137254902, alpha: 0.8980392157)
    }
    
    
    @IBAction func pageChanged(_ sender: Any) {
        let pc = sender as! UIPageControl
        
        // scrolling the collectionView to the selected page
        collectionView.scrollToItem(at: IndexPath(item: pc.currentPage, section: 0),
                                    at: .centeredHorizontally, animated: true)
        
    }
    
    @IBAction func skipBtn(_ sender: Any) {
        let nextContactController = ContactViewController()
        self.navigationController?.pushViewController(nextContactController, animated: true)
    }
    
    @IBAction func btnConnectHealth(_ sender: Any) {
        if  pageControl.currentPage == 1 {
            btnConnectHealth.setTitle("Connect with Health App", for: .normal)
            authorizeHealthKit()
        }
        
        pageControl.currentPage = pageControl.currentPage + 1
        let i = IndexPath(item: pageControl.currentPage, section: 0)
        collectionView.scrollToItem(at: i as IndexPath, at: .centeredHorizontally, animated: true)
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
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
    
    // to update the UIPageControl
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}
