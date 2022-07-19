//
//  NotesView.swift
//  WatchHelpi WatchKit Extension
//
//  Created by Abdhi P (Work) on 17/07/22.
//

import SwiftUI

struct NotesView: View {

  var connectivityHandler = WatchSessionManager.shared

  @State private var notesCoordinator: NotesCoordinator! = nil
  @State private var notes = ""

  var body: some View {
    ZStack {
      ScrollView {
        VStack(alignment: .leading, spacing: 8) {
          Text("Help, this person fainted!")
            .font(.system(size: 27, weight: .semibold, design: .rounded))
            .foregroundColor(.white)

          VStack {
            Text("Personal notes:\n")
              .font(.system(size: 16, weight: .semibold, design: .rounded))
              .foregroundColor(.white)

            +

            Text(notes)
              .font(.system(size: 16, weight: .regular, design: .rounded))
              .foregroundColor(.gray)
          }

          NavigationLink {
            ConfirmAlertView()
          } label: {
            Text("Continue")
              .font(.system(size: 16, weight: .semibold, design: .rounded))
              .foregroundColor(.black)
          }
          .background(Color(UIColor(red: 1.00, green: 0.11, blue: 0.42, alpha: 1.00)))
          .cornerRadius(9)
        }
      }
    }
    .navigationBarHidden(true)
    .onAppear {
      AVService.shared.playSoundTimer()
      connectivityHandler.startSession()
      notesCoordinator = NotesCoordinator(notesHandler: { note in
        self.notes = note
      })
      connectivityHandler.watchOSDelegate = notesCoordinator
    }
    .onDisappear {
      AVService.shared.audioPlayer?.stop()
    }
  }
}

class NotesCoordinator: NSObject, WatchOSDelegate {

  private let notesHandler: (String) -> Void

  init(notesHandler: @escaping (String) -> Void) {
    self.notesHandler = notesHandler
  }
  
  func messageReceived(tuple: MessageReceived) {

  }

  func applicationContextReceived(tuple: ApplicationContextReceived) {
    DispatchQueue.main.async {
      if let notes = tuple.applicationContext["notes"] as? String {
        self.notesHandler(notes)
      }
    }
  }
}

struct NotesView_Previews: PreviewProvider {
  static var previews: some View {
    NotesView()
  }
}
