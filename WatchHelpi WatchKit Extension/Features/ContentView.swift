//
//  ContentView.swift
//  WatchHelpi WatchKit Extension
//
//  Created by Abdhi P (Work) on 14/07/22.
//

import SwiftUI
import ClockKit

struct ContentView: View {
//    @State var isPlaying: Bool
    @State private var animationAmount = 1.0
    var body: some View {

        NavigationLink(destination: CircleProgress()) {
            ZStack {
                Circle()
                    .frame(width: 160, height: 160)
                    .foregroundColor(Color(UIColor(red: 0.31, green: 0.03, blue: 0.13, alpha: 1.00)))
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(Animation.easeOut(duration: 1)
                        .repeatForever(autoreverses: false), value: animationAmount)
                
                Image("button")
                    .resizable()
                    .frame(width: 160, height: 160)
                    .padding()
                
                
                Text("Help")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .medium, design: .default))
                    .fontWeight(.bold)
            } .onAppear(){
                animationAmount = 2
            }
        }
        .buttonStyle(PlainButtonStyle())
        .background(
           
        )
        .navigationBarHidden(true)
    }
    
    

  func getData() {
    let server = CLKComplicationServer.sharedInstance()
    if let complications = server.activeComplications {
      for complication in complications {
        server.reloadTimeline(for: complication)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
