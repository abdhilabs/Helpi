//
//  AlertCancelView.swift
//  WatchHelpi WatchKit Extension
//
//  Created by Abdhi P (Work) on 15/07/22.
//

import SwiftUI

struct ConfirmAlertView: View {
  
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    VStack(alignment: .center, spacing: 20) {
      Text("Apakah sudah mendapat bantuan?")
        .font(.system(size: 19, weight: .medium, design: .rounded))
        .foregroundColor(.white)
        .fontWeight(.semibold)
        .multilineTextAlignment(.center)
      
      VStack {
        NavigationLink {
          GratitudeView()
        } label: {
          Text("Iya")
            .font(.system(size: 17, weight: .medium, design: .rounded))
            .foregroundColor(Color.black)
            .fontWeight(.semibold)
        }
        .background(Color(UIColor(red: 1.00, green: 0.18, blue: 0.03, alpha: 1.00)))
        .cornerRadius(20)
        
        Button(action: {
          self.presentationMode.wrappedValue.dismiss()
        }, label: {
          Text("Tidak")
            .fontWeight(.semibold)
            .foregroundColor(.white)
        })
      }
    }
    .navigationBarHidden(true)
  }
}

struct GeneralAlertView_Previews: PreviewProvider {
  static var previews: some View {
    ConfirmAlertView()
  }
}
