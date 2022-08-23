//
//  TutorialViewController.swift
//  Helpi
//
//  Created by Miftakhul Huda on 01/07/22.
//

import UIKit

class TutorialViewController: UIViewController {
  
  
  @IBOutlet weak var tutorialImageView: UIImageView!
  var tutorialImage = ["TutorialScreen1", "TutorialScreen2", "TutorialScreen3", "TutorialScreen4", "TutorialScreen5", "TutorialScreen6", "TutorialScreen7", "TutorialScreen8"]
  var currentTutorIndex = 0
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view = view
    view.backgroundColor = UIColor(red: 0.69, green: 0.69, blue: 0.69, alpha: 1.00)
    
    let img = UIImage(named: tutorialImage[0])
    tutorialImageView.image = img
    view.addSubview(tutorialImageView)
    
    let tap = UITapGestureRecognizer(target: self, action: #selector(TutorialViewController.nextImage(gesture:)))
    tutorialImageView.addGestureRecognizer(tap)
    tutorialImageView.isUserInteractionEnabled = true
    tutorialImageView.center = view.center
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
  @objc func nextImage(gesture : UIPinchGestureRecognizer){
    currentTutorIndex += 1
    if currentTutorIndex < tutorialImage.count{
      tutorialImageView.image = UIImage(named: tutorialImage[currentTutorIndex])
    }else{
      //to Main screen
      let nextHomeController = HomeViewController()
      self.navigationController?.pushViewController(nextHomeController, animated: true)
    }
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
