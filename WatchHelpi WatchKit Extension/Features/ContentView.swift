//
//  ContentView.swift
//  WatchHelpi WatchKit Extension
//
//  Created by Abdhi P (Work) on 14/07/22.
//

import SwiftUI

struct ContentView: View {

  var connectivityHandler = WatchSessionManager.shared

  @State private var animationAmount = 1.0
  @State private var isShowNext = false

  var body: some View {

    NavigationView {
      NavigationLink(destination: CircleProgressView(), isActive: $isShowNext) {
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
            .onTapGesture {
              isShowNext.toggle()
            }

          Text("Help")
            .foregroundColor(.white)
            .font(.system(size: 30, weight: .bold, design: .default))
        }
        .onAppear {
          animationAmount = 2
        }
      }
      .buttonStyle(PlainButtonStyle())
    }
    .onAppear {
      connectivityHandler.startSession()
    }
    .navigationBarHidden(true)
    .environment(\.rootPresentationMode, $isShowNext)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
