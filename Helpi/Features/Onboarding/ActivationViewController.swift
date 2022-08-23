//
//  ShortcutViewController.swift
//  Helpi
//
//  Created by Miftakhul Huda on 28/06/22.
//

import UIKit
import IntentsUI

class ActivationViewController: UIViewController {
  
  var title1Label1 : UILabel!
  var title2Label1 : UILabel!
  var title2Label2 : UILabel!
  var title2Label3 : UILabel!
  var descLabel1 : UILabel!
  var descLabel2 : UILabel!
  var descLabel3 : UILabel!
  var descLabel4 : UILabel!
  var imageNumber1 : UIImage!
  var imageNumber2 : UIImage!
  var imageNumber3 : UIImage!
  var imageNumber4 : UIImage!
  var startButton : UIButton!
  var shortcutButton : INUIAddVoiceShortcutButton!
  var backtapTutorialButton : UIButton!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    title1Label1 = UILabel()
    title1Label1.translatesAutoresizingMaskIntoConstraints = false
    title1Label1.font = .rounded(ofSize: 24, weight: .semibold)
    title1Label1.text = "Cara Aktifkan Peringatan"
    title1Label1.numberOfLines = 0
    title1Label1.textAlignment = .center
    view.addSubview(title1Label1)
    
    
    title2Label1 = UILabel()
    title2Label1.translatesAutoresizingMaskIntoConstraints = false
    title2Label1.font = .rounded(ofSize: 17, weight: .semibold)
    title2Label1.text = "Tombol Darurat dalam Aplikasi"
    title2Label1.numberOfLines = 0
    title2Label1.textAlignment = .center
    view.addSubview(title2Label1)
    
    imageNumber1 = UIImage(named: "Circle.Number1")
    let imageView1 = UIImageView(image: imageNumber1!)
    imageView1.translatesAutoresizingMaskIntoConstraints = false
    imageView1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    view.addSubview(imageView1)
    
    descLabel1 = UILabel()
    descLabel1.translatesAutoresizingMaskIntoConstraints = false
    descLabel1.font = .rounded(ofSize: 17, weight: .regular)
    descLabel1.text = "Aktifkan peringatan menggunakan tombol darurat dalam aplikasi."
    descLabel1.numberOfLines = 0
    descLabel1.textAlignment = .left
    view.addSubview(descLabel1)
    
    
    title2Label2 = UILabel()
    title2Label2.translatesAutoresizingMaskIntoConstraints = false
    title2Label2.font = .rounded(ofSize: 17, weight: .medium)
    title2Label2.text = "Pintasan Siri"
    title2Label2.numberOfLines = 0
    title2Label2.textAlignment = .center
    view.addSubview(title2Label2)
    
    imageNumber2 = UIImage(named: "Circle.Number2")
    let imageView2 = UIImageView(image: imageNumber2!)
    imageView2.translatesAutoresizingMaskIntoConstraints = false
    imageView2.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    view.addSubview(imageView2)
    
    descLabel2 = UILabel()
    descLabel2.translatesAutoresizingMaskIntoConstraints = false
    descLabel2.font = .rounded(ofSize: 17, weight: .regular)
    descLabel2.text = "Aktifkan peringatan dengan mengatakan 'Hai Siri get help'"
    descLabel2.numberOfLines = 0
    descLabel2.textAlignment = .left
    view.addSubview(descLabel2)
    
    descLabel3 = UILabel()
    descLabel3.translatesAutoresizingMaskIntoConstraints = false
    descLabel3.font = .rounded(ofSize: 17, weight: .regular)
    descLabel3.text = "Aktifkan Pintasan Siri dengan mengetuk tombol di bawah"
    descLabel3.numberOfLines = 0
    descLabel3.textAlignment = .left
    view.addSubview(descLabel3)
    
    shortcutButton = INUIAddVoiceShortcutButton(style: .blackOutline)
    shortcutButton.backgroundColor = #colorLiteral(red: 1, green: 0.1843137255, blue: 0.02745098039, alpha: 1)
    shortcutButton.shortcut = INShortcut(intent: intent )
    shortcutButton.delegate = self
    shortcutButton.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(shortcutButton)
    
    title2Label3 = UILabel()
    title2Label3.translatesAutoresizingMaskIntoConstraints = false
    title2Label3.font = .rounded(ofSize: 17, weight: .medium)
    title2Label3.text = "Ketuk Belakang Ponsel"
    title2Label3.numberOfLines = 0
    title2Label3.textAlignment = .center
    view.addSubview(title2Label3)
    
    imageNumber3 = UIImage(named: "Circle.Number3")
    let imageView3 = UIImageView(image: imageNumber3!)
    imageView3.translatesAutoresizingMaskIntoConstraints = false
    imageView3.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    view.addSubview(imageView3)
    
    descLabel4 = UILabel()
    descLabel4.translatesAutoresizingMaskIntoConstraints = false
    descLabel4.font = .rounded(ofSize: 17, weight: .regular)
    descLabel4.text = "Atur Kembali Ketuk belakang ponsel untuk mengaktifkan peringatan dengan mengetuk bagian belakang ponsel Anda."
    descLabel4.numberOfLines = 0
    descLabel4.textAlignment = .left
    view.addSubview(descLabel4)
    
    backtapTutorialButton = UIButton()
    backtapTutorialButton.translatesAutoresizingMaskIntoConstraints = false
    backtapTutorialButton.backgroundColor = UIColor.white
    //        backtapTutorialButton.backgroundColor = .clear
    backtapTutorialButton.titleLabel?.textAlignment = .left
    backtapTutorialButton.titleLabel?.numberOfLines = 0
    backtapTutorialButton.titleLabel?.font = .rounded(ofSize: 17, weight: .bold)
    backtapTutorialButton.setTitle("Bagaimana cara aktifkan ketuk belakang ponsel", for: .normal)
    backtapTutorialButton.setTitleColor(UIColor(red: 0.0258, green: 0.3152, blue: 0.6589, alpha: 1), for: .normal)
    backtapTutorialButton.titleLabel?.textColor = UIColor.blue
    backtapTutorialButton.addTarget(self, action: #selector(showMyViewControllerInACustomizedSheet), for: .touchDown)
    view.addSubview(backtapTutorialButton)
    
    
    startButton = UIButton()
    startButton.translatesAutoresizingMaskIntoConstraints = false
    startButton.backgroundColor = #colorLiteral(red: 1, green: 0.1843137255, blue: 0.02745098039, alpha: 1)
    startButton.titleLabel?.textAlignment = .center
    startButton.titleLabel?.font = .rounded(ofSize: 17, weight: .medium)
    startButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
    startButton.titleLabel?.textColor = UIColor.white
    startButton.setTitle("Mulai", for: .normal)
    startButton.dropShadow()
    startButton.layer.cornerRadius = 10
    startButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    view.addSubview(startButton)
    
    
    
    
    NSLayoutConstraint.activate([
      title1Label1.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
      title1Label1.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
      
      title2Label1.topAnchor.constraint(equalTo: title1Label1.bottomAnchor, constant: 50),
      title2Label1.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 75),
      
      imageView1.centerYAnchor.constraint(equalTo: title2Label1.centerYAnchor),
      imageView1.rightAnchor.constraint(equalTo: title2Label1.leftAnchor, constant: -20),
      
      descLabel1.topAnchor.constraint(equalTo: title2Label1.bottomAnchor,constant: 10),
      descLabel1.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
      descLabel1.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 75),
      descLabel1.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -35),
      
      title2Label2.topAnchor.constraint(equalTo: descLabel1.bottomAnchor, constant: 40),
      title2Label2.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 75),
      
      imageView2.centerYAnchor.constraint(equalTo: title2Label2.centerYAnchor),
      imageView2.rightAnchor.constraint(equalTo: title2Label2.leftAnchor, constant: -20),
      
      descLabel2.topAnchor.constraint(equalTo: title2Label2.bottomAnchor,constant: 10),
      descLabel2.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
      descLabel2.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 75),
      descLabel2.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -35),
      
      descLabel3.topAnchor.constraint(equalTo: descLabel2.bottomAnchor,constant: 10),
      descLabel3.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
      descLabel3.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 75),
      descLabel3.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -35),
      
      shortcutButton.topAnchor.constraint(equalTo: descLabel3.bottomAnchor, constant: 20),
      shortcutButton.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
      shortcutButton.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 75),
      shortcutButton.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -35),
      
      title2Label3.topAnchor.constraint(equalTo: shortcutButton.bottomAnchor, constant: 40),
      title2Label3.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 75),
      
      imageView3.centerYAnchor.constraint(equalTo: title2Label3.centerYAnchor),
      imageView3.rightAnchor.constraint(equalTo: title2Label3.leftAnchor, constant: -20),
      
      descLabel4.topAnchor.constraint(equalTo: title2Label3.bottomAnchor,constant: 10),
      descLabel4.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 75),
      descLabel4.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -35),
      
      backtapTutorialButton.topAnchor.constraint(equalTo: descLabel4.bottomAnchor, constant: 10),
      backtapTutorialButton.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 45),
      backtapTutorialButton.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -70),
      
      startButton.heightAnchor.constraint(equalToConstant: 46),
      startButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20),
      startButton.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 20),
      startButton.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -20),
    ])
  }
  
  func showMessage() {
    let alert = UIAlertController(title: "Done!", message: "This is your first shortcut action!", preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    self.present(alert, animated: true, completion: nil)
  }
  
  @objc func showMyViewControllerInACustomizedSheet() {
    let viewControllerToPresent = BacktapTutorialViewController()
    if let sheet = viewControllerToPresent.sheetPresentationController {
      sheet.detents = [.large()]
      sheet.largestUndimmedDetentIdentifier = .medium
      sheet.prefersScrollingExpandsWhenScrolledToEdge = false
      sheet.prefersEdgeAttachedInCompactHeight = true
      sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
    }
    present(viewControllerToPresent, animated: true, completion: nil)
  }
  
  @objc func buttonTapped() {
    let nextViewController = HomeTabBarViewController()
    view.window?.rootViewController = nextViewController
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: animated)
  }
  
}

extension ActivationViewController {
  @available(iOS 15.5, *)
  public var intent: HelpiEmergencyIntent {
    let testIntent = HelpiEmergencyIntent()
    testIntent.suggestedInvocationPhrase = "Help Me"
    return testIntent
  }
}

extension ActivationViewController: INUIAddVoiceShortcutButtonDelegate {
  @available(iOS 15.5, *)
  func present(_ addVoiceShortcutViewController: INUIAddVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
    addVoiceShortcutViewController.delegate = self
    addVoiceShortcutViewController.modalPresentationStyle = .formSheet
    present(addVoiceShortcutViewController, animated: true, completion: nil)
  }
  
  @available(iOS 15.5, *)
  func present(_ editVoiceShortcutViewController: INUIEditVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
    editVoiceShortcutViewController.delegate = self
    editVoiceShortcutViewController.modalPresentationStyle = .formSheet
    present(editVoiceShortcutViewController, animated: true, completion: nil)
  }
  
  
}

extension ActivationViewController: INUIAddVoiceShortcutViewControllerDelegate {
  @available(iOS 15.5, *)
  func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
    controller.dismiss(animated: true, completion: nil)
  }
  
  @available(iOS 15.5, *)
  func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
    controller.dismiss(animated: true, completion: nil)
  }
  
  
}

extension ActivationViewController: INUIEditVoiceShortcutViewControllerDelegate {
  @available(iOS 15.5, *)
  func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController, didUpdate voiceShortcut: INVoiceShortcut?, error: Error?) {
    controller.dismiss(animated: true, completion: nil)
  }
  
  @available(iOS 15.5, *)
  func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController, didDeleteVoiceShortcutWithIdentifier deletedVoiceShortcutIdentifier: UUID) {
    controller.dismiss(animated: true, completion: nil)
  }
  
  @available(iOS 15.5, *)
  func editVoiceShortcutViewControllerDidCancel(_ controller: INUIEditVoiceShortcutViewController) {
    controller.dismiss(animated: true, completion: nil)
  }
}

//extension UIColor {
//   convenience init(rgb: Int) {
//       self.init(
//        red: CGFloat((rgb >> 16) & 0xFF),
//        green: CGFloat((rgb >> 8) & 0xFF),
//        blue: CGFloat(rgb & 0xFF)
//       )
//   }
//}
