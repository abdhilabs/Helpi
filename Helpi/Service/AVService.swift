//
//  AVService.swift
//  Helpi
//
//  Created by PUTRI RAHMADEWI on 18/07/22.
//

import Foundation
import AVFoundation

class AVService{

  static let shared = AVService()

  var soundURI: URL?
  var audioPlayer: AVAudioPlayer?

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
    playSound(file: "Fainted_AI_Sound", fileExtension: "mp3")
    audioPlayer?.numberOfLoops = 5
    audioPlayer?.volume = 1.0
    audioPlayer?.play()
  }
}
