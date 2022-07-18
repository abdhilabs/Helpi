//
//  PlaySound.swift
//  WatchHelpi WatchKit Extension
//
//  Created by PUTRI RAHMADEWI on 17/07/22.
//

import SwiftUI

struct PlaySound: View {
    
    @State var time:Timer?
    var body: some View {
        VStack{
            Button(action: {
                if self.time == nil{
                    self.time = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){_ in
                        WKInterfaceDevice.current().play(.notification)
                    }
                } else{
                self.time?.invalidate()
                self.time = nil
                }
            }){
                Text(time == nil ? "Start Sound" : "Stop On")
            }
            HStack{
                Text(time == nil ? "Sound off" : "Sound On")
                Image(systemName: "speaker")
            }.foregroundColor(time == nil ? .red : .green)
        }
    }
}

struct PlaySound_Previews: PreviewProvider {
    static var previews: some View {
        PlaySound()
    }
}
