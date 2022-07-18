//
//  ScreenNotes.swift
//  WatchHelpi WatchKit Extension
//
//  Created by PUTRI RAHMADEWI on 15/07/22.
//

import SwiftUI
import AVFoundation

struct ScreenNotesView: View {

  @State var time: Timer?

  var body: some View {
    ZStack {
      VStack {
        Text("Help, this person fainted!")
          .font(.system(size: 27, weight: .semibold, design: .rounded))
          .fontWeight(.semibold)
          .padding(.bottom, 10)
          .multilineTextAlignment(.leading)
        NavigationLink{
          NotesView()
        }label: {
          Text("Yes")
            .font(.system(size: 17, weight: .medium, design: .rounded))
            .foregroundColor(Color.black)
            .fontWeight(.semibold)
        }
        .frame(height: 50)
        .background(Color(UIColor(red: 1.00, green: 0.11, blue: 0.42, alpha: 1.00)))
        .cornerRadius(20)
        .navigationBarHidden(true)
      }
    }
    .onAppear(){
      AVService.shared.playSoundTimer()
    }
    .onDisappear{
      AVService.shared.audioPlayer?.stop()
    }
  }
}

struct ScreenNotes_Previews: PreviewProvider {
  static var previews: some View {
    ScreenNotesView()
  }
}
