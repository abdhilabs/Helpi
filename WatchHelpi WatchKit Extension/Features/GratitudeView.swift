//
//  GratitudeView.swift
//  WatchHelpi WatchKit Extension
//
//  Created by Miftakhul Huda on 15/07/22.
//

import SwiftUI

struct GratitudeView: View {

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

        //action to the next view

      }, label: {
        Text("Close")
          .font(.system(.body, design: .rounded))
          .fontWeight(.semibold)
          .foregroundColor(.black)
      })
      .frame(height: 35)
      .background(Color(.sRGB, red: 0.6555, green: 0.0694, blue: 0.2751, opacity: 1))
      .cornerRadius(21)
      .padding(.horizontal, 2)
      .padding(.vertical, 20)
    }
  }
}

struct GratitudeView_Previews: PreviewProvider {
  static var previews: some View {
    GratitudeView()
  }
}
