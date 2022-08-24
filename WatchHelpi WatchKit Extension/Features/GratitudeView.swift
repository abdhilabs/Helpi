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
      Text("Terima kasih telah menyelamatkan saya!")
        .font(.system(.title3, design: .rounded))
        .fontWeight(.semibold)
        .multilineTextAlignment(.center)
        .foregroundColor(.white)
      
      Spacer()
      
      Button(action: {
        rootPresentationMode.wrappedValue.dismiss()
      }, label: {
        Text("Keluar")
          .font(.system(.body, design: .rounded))
          .fontWeight(.semibold)
          .foregroundColor(.black)
      })
      .background(Color(UIColor(red: 1.00, green: 0.18, blue: 0.03, alpha: 1.00)))
      .cornerRadius(20)
      .padding(.horizontal, 2)
      .padding(.vertical, 10)
    }
    .navigationBarHidden(true)
  }
}

struct GratitudeView_Previews: PreviewProvider {
  static var previews: some View {
    GratitudeView()
  }
}
