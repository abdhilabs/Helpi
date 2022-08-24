//
//  NotesView.swift
//  WatchHelpi WatchKit Extension
//
//  Created by Abdhi P (Work) on 17/07/22.
//

import SwiftUI

struct NotesView: View {
  
  var cloudKitService = CloudKitService()
  var connectivityHandler = WatchSessionManager.shared
  
  @State private var notesCoordinator: NotesCoordinator! = nil
  @State private var notes = ""
  
  var body: some View {
    ZStack {
      ScrollView {
        VStack(alignment: .leading, spacing: 8) {
          Text("Tolong, orang ini penderita Aritmia!")
            .font(.system(size: 27, weight: .semibold, design: .rounded))
            .foregroundColor(.white)
          
          VStack {
            Text("Catatan Pribadi :\n")
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
            Text("Selanjutnya")
              .font(.system(size: 16, weight: .semibold, design: .rounded))
              .foregroundColor(.black)
          }
          .background(Color(UIColor(red: 1.00, green: 0.18, blue: 0.03, alpha: 1.00)))
          .cornerRadius(9)
        }
      }
    }
    .navigationBarHidden(true)
    .onAppear {
      AVService.shared.playSoundTimer()
      notesCoordinator = NotesCoordinator(notesHandler: { note, recordName in
        self.notes = note
        self.sendPushNotif(by: recordName)
      })
      connectivityHandler.watchOSDelegate = notesCoordinator
      connectivityHandler.sendMessage(message: ["notes": "Bawa aku kerumah sakit."]) { replyHandler in
        DispatchQueue.main.async {
          if let notes = replyHandler["notes"] as? String, let recordName = replyHandler["recordName"] as? String {
            self.notes = notes
            self.sendPushNotif(by: recordName)
          }
        }
      } errorHandler: { error in
        print("Error: \(error.localizedDescription)")
      }
      
    }
    .onDisappear {
      AVService.shared.audioPlayer?.stop()
    }
  }
  
  private func sendPushNotif(by recordName: String) {
    cloudKitService.updateDataFriend(by: .init(recordName: recordName)) { name in
      print("Success push notif...")
    }
  }
}

class NotesCoordinator: NSObject, WatchOSDelegate {
  
  private let notesHandler: (String, String) -> Void
  
  init(notesHandler: @escaping (String, String) -> Void) {
    self.notesHandler = notesHandler
  }
  
  func messageReceived(tuple: MessageReceived) {
    
  }
  
  func applicationContextReceived(tuple: ApplicationContextReceived) {
    DispatchQueue.main.async {
      if let notes = tuple.applicationContext["notes"] as? String, let recordName = tuple.applicationContext["recordName"] as? String {
        self.notesHandler(notes, recordName)
      } else if let notes = tuple.applicationContext["notes"] as? String {
        self.notesHandler(notes, "")
      }
    }
  }
}

struct NotesView_Previews: PreviewProvider {
  static var previews: some View {
    NotesView()
  }
}
