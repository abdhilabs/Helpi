//
//  GratitudeView.swift
//  WatchHelpi WatchKit Extension
//
//  Created by Miftakhul Huda on 15/07/22.
//

import SwiftUI

struct GratitudeView: View {

  @Environment(\.rootPresentationMode) var rootPresentationMode

  var body: some View {
    VStack {
      Text("Thank you for saving me!")
        .font(.system(.title3, design: .rounded))
        .fontWeight(.semibold)
        .multilineTextAlignment(.center)
        .padding()
        .foregroundColor(.white)

      Spacer()

      Button(action: {
        rootPresentationMode.wrappedValue.dismiss()
      }, label: {
        Text("Close")
          .font(.system(.body, design: .rounded))
          .fontWeight(.semibold)
          .foregroundColor(.black)
      })
      .background(Color(UIColor(red: 1.00, green: 0.11, blue: 0.42, alpha: 1.00)))
      .cornerRadius(20)
      .padding(.horizontal, 2)
      .padding(.vertical, 20)
    }
    .navigationBarHidden(true)
  }
}

struct GratitudeView_Previews: PreviewProvider {
  static var previews: some View {
    GratitudeView()
  }
}
