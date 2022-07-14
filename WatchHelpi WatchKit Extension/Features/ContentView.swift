//
//  ContentView.swift
//  WatchHelpi WatchKit Extension
//
//  Created by Abdhi P (Work) on 14/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      NavigationLink(destination: CountdownView()) {
        ZStack {
          Circle()
          .foregroundColor(.red)

          Text("Help")
            .foregroundColor(.white)
        }
      }
      .frame(width: 100, height: 100)
      .background(
        Circle()
          .foregroundColor(.red)
      )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
