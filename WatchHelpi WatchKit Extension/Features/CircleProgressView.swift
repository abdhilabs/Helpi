//
//  CircleProgress.swift
//  WatchHelpi WatchKit Extension
//
//  Created by PUTRI RAHMADEWI on 14/07/22.
//

import SwiftUI

let timer = Timer
  .publish(every: 1, on: .main, in: .common)
  .autoconnect()

struct LockView: View {
  var counter: Int
  var countTo: Int
  @State var jump = false
  @State var thirdScreenShown = false
  var body: some View {
    VStack {
      Text("Alert start in")
        .fontWeight(.semibold)
      Spacer()
      Text(counterToMinutes())
        .font(.system(size: 30, weight: .bold, design: .default))
        .padding(.bottom, 30)
    }
  }

  func counterToMinutes() -> String {
    let currentTime = countTo - counter
    let seconds = currentTime % 60
    return "\(seconds)"
  }

}

struct ProgressTrack: View {
  var body: some View {
    Circle()
      .stroke(lineWidth: 3)
      .foregroundColor(Color(UIColor(red: 0.59, green: 0.59, blue: 0.59, alpha: 1.00)))
      .padding(.top,30)
      .padding(.bottom,10)
  }
}

struct ProgressBar: View {
  var counter: Int
  var countTo: Int
  var body: some View {
    Circle()
      .trim(from: 0.0, to: CGFloat(min(progress(), 1.0)))
      .stroke(style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
      .rotation(Angle(degrees: 90))
      .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
      .foregroundColor(Color(UIColor(red: 1.00, green: 0.11, blue: 0.42, alpha: 1.00)))
      .padding(.top,30)
      .padding(.bottom,10)
  }

  func completed() -> Bool {
    return progress() == 1
  }

  func progress() -> CGFloat {
    return (CGFloat(counter) / CGFloat(countTo))
  }
}

struct CircleProgressView: View {

  @Environment(\.dismiss) var dismiss

  @State var counter: Int = 0
  @State var jump = false

  let countTo: Int = 5

  var body: some View {

    if #available(watchOSApplicationExtension 7.0, *) {
      VStack {
        NavigationView{
          VStack{
            ZStack{
              ProgressTrack()
              ProgressBar(counter: counter, countTo: countTo)
              LockView(counter: counter, countTo: countTo)
            }
          }.onReceive(timer) { time in
            self.counter += 1
            if counter == countTo {
              jump = true
            }
          }
        }

        NavigationLink(isActive: $jump) {
          NotesView()
        } label: {
          EmptyView()
        }
        .buttonStyle(.plain)

        NavigationLink{
          CancelConfirmation()
        } label: {
          Text("Cancel")
            .font(.system(size: 17, weight: .semibold, design: .rounded))
            .foregroundColor(.black)
        }
        .background(Color(UIColor(red: 1.00, green: 0.11, blue: 0.42, alpha: 1.00)))
        .cornerRadius(20)
      }
      .onAppear {
        counter = 0
      }
      .onDisappear {
        counter = 10
      }
      .navigationBarHidden(true)
    }
  }

}

struct CircleProgress_Previews: PreviewProvider {
  static var previews: some View {
    CircleProgressView()
  }
}
