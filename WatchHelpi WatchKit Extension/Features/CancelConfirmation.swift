//
//  CancelConfirmation.swift
//  WatchHelpi WatchKit Extension
//
//  Created by PUTRI RAHMADEWI on 15/07/22.
//

import SwiftUI

struct CancelConfirmation: View {

  @Environment(\.rootPresentationMode) var rootPresentationMode
  @Environment(\.presentationMode) var presentationMode

  var body: some View {
    ZStack {
      VStack {
        VStack {
          Text("Are you sure you want to cancel the alert?")
            .fontWeight(.semibold)
            .padding(.bottom, 10)
            .multilineTextAlignment(.center)
        }

        Button {
          self.rootPresentationMode.wrappedValue.dismiss()
        } label: {
          Text("Yes")
            .font(.system(size: 17, weight: .medium, design: .rounded))
            .foregroundColor(Color.black)
            .fontWeight(.semibold)
        }
        .background(Color(UIColor(red: 1.00, green: 0.11, blue: 0.42, alpha: 1.00)))
        .cornerRadius(20)

        Button(action: {
          self.presentationMode.wrappedValue.dismiss()
        }, label: {
          Text("No")
            .fontWeight(.semibold)
            .foregroundColor(.white)
        })
      }
    }
    .navigationBarHidden(true)
  }
}

struct CancelConfirmation_Previews: PreviewProvider {
  static var previews: some View {
    CancelConfirmation()
  }
}
