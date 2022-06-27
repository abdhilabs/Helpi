//
//  OnboardViewController.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 26/06/22.
//

import UIKit

class OnboardViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var buttonSkipFix: UILabel!
    
    
    let onboarding: [dataOnboarding] = [dataOnboarding(image: "foto", title: "Alert Helper", description: "Helpi will alert your surroundings and immediately send notification to your helper when you are about to faint."), dataOnboarding(image: "foto", title: "First Aid", description: "Helpi will show first responders how to give you first aid and how to reach your emergency contact."), dataOnboarding(image: "foto", title: "Health App Access", description: "Helpi needs permission to read/access data from Apple Health in order to manage your health record.Tap the button below to grant permission to read the necessary data.")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // to make the button rounded
               // register the custom CollectionViewCell and assign the delegates to the ViewController
                self.skipButton.layer.cornerRadius = 40
//    skipButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
                self.collectionView.backgroundColor = .white
                self.collectionView.dataSource = self
                self.collectionView.delegate = self
                self.collectionView.register(UINib(nibName: OnboardingCollectionViewCell.identifier, bundle: Bundle.main),
                                            forCellWithReuseIdentifier: "OnboardingCollectionViewCell")
               
               // set the number of pages to the number of Onboarding Screens
               self.pageControl.numberOfPages = self.onboarding.count
    }


    @IBAction func pageChanged(_ sender: Any) {
//        let pc = sender as! UIPageControl
//
//               // scrolling the collectionView to the selected page
//               collectionView.scrollToItem(at: IndexPath(item: pc.currentPage, section: 0),
//                                           at: .centeredHorizontally, animated: true)
    }
    
    @IBAction func buttonSkip(_ sender: Any) {
//        guard let indexPath = collectionView.indexPathsForVisibleItems.first.flatMap({
//            IndexPath(item: pageControl.currentPage, section: $0.section)
//           }), collectionView.cellForItem(at: indexPath) != nil else {
//               return
//           }
//
//           collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//
//
//
        if  pageControl.currentPage == 1 {
//            skipButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            skipButton.setTitle("Grant Acces", for: .normal)
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
