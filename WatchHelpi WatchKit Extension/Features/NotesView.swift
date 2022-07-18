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
            .font(.title2)
            .bold()
            .foregroundColor(.white)

          VStack {
            Text("Personal notes:\n")
              .font(.subheadline)
              .bold()

            +

            Text(notes)
              .font(.caption)
          }

          NavigationLink {
            ConfirmAlertView()
          } label: {
            Text("Continue")
              .foregroundColor(.white)
              .bold()
          }
          .background(.red)
          .cornerRadius(9)

        }
      }
    }
    .onAppear {
      connectivityHandler.startSession()
      notesCoordinator = NotesCoordinator(notesHandler: { note in
        self.notes = note
      })
      connectivityHandler.watchOSDelegate = notesCoordinator
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
