//
//  HelpViewController.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 27/06/22.
//

import UIKit
import AVFoundation

class HelpViewController: UIViewController {
    
    var soundURI: URL?
    var audioPlayer: AVAudioPlayer?
    
    @IBOutlet weak var titleLabel: UILabel!
  
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var lblAlertStarting: UILabel!
    @IBOutlet weak var viewHelpButton: UIView!
    @IBOutlet weak var lblHelpAndCount: UILabel!
    @IBOutlet weak var btnCancel: UIButton!
    
    var viewProgressBar: CircularProgressBarView!
    var timer: Timer?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        
        titleLabel.font = .rounded(ofSize: 36, weight: .bold)
       descLabel.font = .rounded(ofSize: 18, weight: .regular)
        lblAlertStarting.font = .rounded(ofSize: 18, weight: .regular)
        btnCancel.titleLabel?.font = .rounded(ofSize: 17, weight: .medium)
    }
    
    
    private func configureViews() {
        viewHelpButton.layer.cornerRadius = viewHelpButton.frame.size.width / 2
        viewHelpButton.clipsToBounds = true
        
        setViewTimerStart()
    }
    
    private func setViewTimerStart() {
        lblHelpAndCount.text = "00:05"
        var count = 5
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            count -= 1
            
            if count < 0 {
                self.timer?.invalidate()
                self.audioPlayer?.stop()
                let nextViewController = AssistanceViewController()
                self.navigationController?.pushViewController(nextViewController, animated: true)
            } else {
                self.playSoundTimer()
                self.audioPlayer?.play()
                self.lblHelpAndCount.text = "00:0\(count)"
            }
        }
        
        lblAlertStarting.isHidden = false
        
        lblHelpAndCount.textColor = #colorLiteral(red: 1, green: 0.1058823529, blue: 0.4196078431, alpha: 1)
        viewHelpButton.backgroundColor = .white
        
    }
    
    public func playSound(file: String, fileExtension: String, isLoop: Bool = false){
        soundURI = URL(fileURLWithPath: Bundle.main.path(forResource: file, ofType: fileExtension)!)
        do {
            guard let uri = soundURI else {return}
            audioPlayer = try AVAudioPlayer(contentsOf: uri)
        } catch {
            // couldn't load file :(
        }
    }
    
    public func playSoundTimer(){
        self.playSound(file: "sound", fileExtension: "wav")
    }
    
    @IBAction func didTapCancelButton(_ sender: Any) {
        timer?.invalidate()
        dismiss(animated: true)
    }
}
