//
//  CircleProgress.swift
//  WatchHelpi WatchKit Extension
//
//  Created by PUTRI RAHMADEWI on 14/07/22.
//

import SwiftUI

let imer = Timer
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
    //    @ObservedObject var model: SoundEffectModel
    //    @Binding var rootIsActive : Bool
    @State var counter: Int = 0
    let countTo: Int = 3
    @State var jump = false
    //    @State private var willMoveToNextScreen = false
    
    var body: some View {
        
        if #available(watchOSApplicationExtension 7.0, *) {
            NavigationView{
                VStack{
                    ZStack{
                        ProgressTrack()
                        ProgressBar(counter: counter, countTo: countTo)
                        LockView(counter: counter, countTo: countTo)
                    }
                }.onReceive(imer) { time in
                    if (self.counter < self.countTo) {
                        self.counter += 1
                    }else
                    {
                        jump = true
                    }
                }
            }
            
            NavigationLink(isActive: $jump) {
                ScreenNotesView()
            } label: {
                EmptyView()
            }.buttonStyle(PlainButtonStyle())
            
            NavigationLink{
                CancelConfirmation()
            }label: {
                Text("cancel")
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
    
}



struct CircleProgress_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressView()
    }
}
