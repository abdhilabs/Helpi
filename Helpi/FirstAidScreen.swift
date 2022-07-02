//
//  FirstAidScreen.swift
//  Helpi
//
//  Created by PUTRI RAHMADEWI on 29/06/22.
//

import UIKit

class FirstAidScreen: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var btnEmergency: UIButton!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var number4: UIView!
    @IBOutlet weak var number3: UIView!
    @IBOutlet weak var number1: UIView!
    @IBOutlet weak var number2: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btnNext: UIButton!
    
    @IBOutlet weak var btnPrevious: UIButton!
    let firstAid: [FirstAid] = [FirstAid(image: "screen1", title: "Ensure Surrounding is Safe", description: "- Ensure that I am in a safe and not in a crowded area \n - Make sure that I have plenty of fresh air \n - Ask other people to move away "), FirstAid(image: "screen2", title: "Lay Me Down", description: "- Lay me down \n - ook for my response by loudly calling my name or squeezing my shoulder"), FirstAid(image: "screen3", title: "Clean Air Way", description: "- Check my mouth and throat \n - Remove any obvious blockages in the mouth or nose, such as vomit, blood, etc."), FirstAid(image: "screen4", title: "Call Emergency", description: "- if my condition is getting worse, please call my emergency contact or call nearby emergency number")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        number1.backgroundColor = UIColor.gray
        //        number2.backgroundColor = UIColor.gray
        
        
        
        self.btnNext.backgroundColor = #colorLiteral(red: 0.2392156863, green: 0.2352941176, blue: 0.5137254902, alpha: 1)
        //        self.btnEmergency.backgroundColor = #colorLiteral(red: 0.2392156863, green: 0.2352941176, blue: 0.5137254902, alpha: 1)
        self.btnPrevious.backgroundColor = #colorLiteral(red: 0.2392156863, green: 0.2352941176, blue: 0.5137254902, alpha: 1)
        self.btnDone.backgroundColor = #colorLiteral(red: 0.2392156863, green: 0.2352941176, blue: 0.5137254902, alpha: 1)
        self.btnEmergency.layer.cornerRadius = 15
        btnEmergency.layer.borderWidth = 1
        btnEmergency.layer.borderColor = #colorLiteral(red: 0.2392156863, green: 0.2352941176, blue: 0.5137254902, alpha: 1)
        self.btnNext.layer.cornerRadius = 15
        self.btnPrevious.layer.cornerRadius = 15
        btnDone.layer.cornerRadius = 15
        
        label1.font = .rounded(ofSize: 36, weight: .bold)
        label2.font = .rounded(ofSize: 36, weight: .bold)
        label3.font = .rounded(ofSize: 36, weight: .bold)
        label4.font = .rounded(ofSize: 36, weight: .bold)
        btnEmergency.titleLabel?.font = .rounded(ofSize: 17, weight: .bold)
        
        btnDone.titleLabel?.font = .rounded(ofSize: 17, weight: .bold)
        btnEmergency.titleLabel?.font = .rounded(ofSize: 17, weight: .bold)
        
        
        btnPrevious.isHidden = true
        number1.layer.cornerRadius = number1.frame.size.width / 2
        number1.clipsToBounds = true
        number2.layer.cornerRadius = number1.frame.size.width / 2
        number2.clipsToBounds = true
        number3.layer.cornerRadius = number1.frame.size.width / 2
        number3.clipsToBounds = true
        number4.layer.cornerRadius = number1.frame.size.width / 2
        number4.clipsToBounds = true
        
        btnDone.isHidden = true
        
        
        
        
        //        number1.layer.cornerRadius = number1.layer.bounds.width / 2
        //        number1.clipsToBounds = true
        
        
        self.collectionView.backgroundColor = .white
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib(nibName: FirstAidCollectionViewCell.identifier, bundle: Bundle.main),
                                     forCellWithReuseIdentifier: "FirstAidCollectionViewCell")
        
        self.pageControl.numberOfPages = self.firstAid.count
        
        
        
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return firstAid.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstAidCollectionViewCell.identifier,
                                                      for: indexPath) as! FirstAidCollectionViewCell
        // function for configuring the cell, defined in the Custom cell class
        cell.configureCell(FirstAid: firstAid[indexPath.item])
        return cell
    }
    
    
    @IBAction func pageChanged(_ sender: Any) {
        let pc = sender as! UIPageControl
        
        // scrolling the collectionView to the selected page
        collectionView.scrollToItem(at: IndexPath(item: pc.currentPage, section: 0),
                                    at: .centeredHorizontally, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func btnNext(_ sender: Any) {
        switch pageControl.currentPage {
        case 0 :
            number1.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
            number2.backgroundColor = #colorLiteral(red: 1, green: 0.1058823529, blue: 0.4196078431, alpha: 1)
            number3.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
            number4.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
            btnDone.isHidden = true
            btnPrevious.isHidden = false
            btnNext.isHidden = false
        case 1 :
            number1.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
            number2.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
            number3.backgroundColor = #colorLiteral(red: 1, green: 0.1058823529, blue: 0.4196078431, alpha: 1)
            number4.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
            btnDone.isHidden = true
            btnPrevious.isHidden = false
            btnNext.isHidden = false
        case 2 :
            number1.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
            number2.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
            number3.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
            number4.backgroundColor = #colorLiteral(red: 1, green: 0.1058823529, blue: 0.4196078431, alpha: 1)
            btnDone.isHidden = false
            btnPrevious.isHidden = false
            btnNext.isHidden = true
        default:
            break
        }
        
        
        pageControl.currentPage = pageControl.currentPage + 1
        let i = IndexPath(item: pageControl.currentPage, section: 0)
        collectionView.scrollToItem(at: i as IndexPath, at: .centeredHorizontally, animated: true)
    }
    
    @IBAction func btnPrevious(_ sender: Any) {
        pageControl.currentPage = pageControl.currentPage - 1
        let i = IndexPath(item: pageControl.currentPage, section: 0)
        collectionView.scrollToItem(at: i as IndexPath, at: .centeredHorizontally, animated: true)
        
        switch pageControl.currentPage {
        case 0 :
            number1.backgroundColor = #colorLiteral(red: 1, green: 0.1058823529, blue: 0.4196078431, alpha: 1)
            number2.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
            number3.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
            number4.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
            btnDone.isHidden = true
            btnPrevious.isHidden = true
            btnNext.isHidden = false
        case 1 :
            number1.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
            number2.backgroundColor = #colorLiteral(red: 1, green: 0.1058823529, blue: 0.4196078431, alpha: 1)
            number3.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
            number4.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
            btnDone.isHidden = true
            btnPrevious.isHidden = false
        case 2 :
            number1.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
            number2.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
            number3.backgroundColor = #colorLiteral(red: 1, green: 0.1058823529, blue: 0.4196078431, alpha: 1)
            number4.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
            btnDone.isHidden = true
            btnPrevious.isHidden = false
        case 3 :
            number1.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
            number2.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
            number3.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
            number4.backgroundColor = #colorLiteral(red: 1, green: 0.1058823529, blue: 0.4196078431, alpha: 1)
            btnPrevious.isHidden = false
            
        default:
            break
        }
    }
    
    
    @IBAction func btnEmergency(_ sender: Any) {
        showActionsheet()
    }
    
    @IBAction func btnDone(_ sender: Any) {
        showAlert()
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Am I safe?", message: "If I am still unconscious, please call my emergency contact or call nearby emergency number to get help. \n\n Tap Done if I am awake or after emergency comes.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { [self] action in
        }))
        
        alert.addAction(UIAlertAction(title: "Done", style: .destructive , handler: {  action in
            let nextDoneController = DoneViewController()
            self.navigationController?.pushViewController(nextDoneController, animated: true)
        }))
        
        
        present(alert, animated: true)
    }
    
    
    
    func showActionsheet(){
        let actionSheet = UIAlertController(title: "Make a call", message: "Kamu bisa memilih contact emergency mana.", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel , handler: { action in
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Emergency Contact 1", style: .default , handler: { action in
            //              self.navigationController?.popViewController(animated: true)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Emergency Contact 2", style: .destructive , handler: { action in
            //              self.performSegue(withIdentifier: "home", sender: nil)
        }))
        
        
        
        present(actionSheet, animated: true)
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
    
    
}
