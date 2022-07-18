//
//  AssistanceViewController.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 27/06/22.
//

import UIKit
import AVFoundation

class AssistanceViewController: UIViewController {

  @IBOutlet weak var titleLabel1: UILabel!
  @IBOutlet weak var titleLabel2: UILabel!
  @IBOutlet weak var btnStart: UIButton!
  @IBOutlet weak var descText: UILabel!

  var soundURI: URL?
  var audioPlayer: AVAudioPlayer?

  private let cloudKitService = CloudKitService()

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: true)
    navigationItem.hidesBackButton = true
    let rightBarButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(didTapRightBarButton))
    rightBarButton.tintColor = .white
    navigationItem.rightBarButtonItem = rightBarButton
  }

  @objc func didTapRightBarButton() {
    self.audioPlayer?.stop()
    dismiss(animated: true)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    titleLabel1.font = .rounded(ofSize: 90, weight: .black)
    titleLabel2.font = .rounded(ofSize: 60, weight: .semibold)
    descText.font = .rounded(ofSize: 18, weight: .medium)
    btnStart.titleLabel?.font = .rounded(ofSize: 17, weight: .semibold)

    playSoundTimer()
    let recordId = SessionManager.shared.getRecordId()
    cloudKitService.updateDataFriend(by: .init(recordName: recordId)) { name in
      DispatchQueue.main.async {
        self.descText.text = "Help! My name is \(name) and I fainted. Please don’t panic and tap on Start Assistance to help me."
      }
    }
  }

func playSound(file: String, fileExtension: String, isLoop: Bool = false){
    soundURI = URL(fileURLWithPath: Bundle.main.path(forResource: file, ofType: fileExtension)!)
    do {
      guard let uri = soundURI else {return}
      audioPlayer = try AVAudioPlayer(contentsOf: uri)
    } catch {
      // couldn't load file :(
    }
  }

  func playSoundTimer(){
    playSound(file: "sound", fileExtension: "mp3")
    audioPlayer?.play()
  }

  @IBAction func didTapStartButton(_ sender: Any) {
    self.audioPlayer?.stop()
    let nextViewController = PersonalNoteViewController()
    navigationController?.pushViewController(nextViewController, animated: true)
  }
}
