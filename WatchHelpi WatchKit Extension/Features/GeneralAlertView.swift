//
//  AlertCancelView.swift
//  WatchHelpi WatchKit Extension
//
//  Created by Abdhi P (Work) on 15/07/22.
//

import SwiftUI

struct GeneralAlertView: View {

  var description: String

  var body: some View {
    VStack {
      Text(description)

      VStack {
        NavigationLink {
          CountdownView()
        } label: {
          Text("Yes")
        }

        NavigationLink {

        } label: {
          Text("No")
        }
      }
    }
  }
}

struct GeneralAlertView_Previews: PreviewProvider {
  static var previews: some View {
    GeneralAlertView(description: "Are you sure you want to cancel the alert?")
  }
}
