//
//  HelpConfirmationView.swift
//  WatchHelpi WatchKit Extension
//
//  Created by Miftakhul Huda on 15/07/22.
//

import SwiftUI

struct HelpConfirmationView: View {
  
  @State private var moveToGratitudeView = false
  
  var body: some View {
    NavigationView {
      VStack(alignment: .center){
        
        Text("Apakah orang ini sudah mendapat bantuan?")
          .font(.system(.title3, design: .rounded))
          .fontWeight(.semibold)
          .multilineTextAlignment(.center)
          .padding()
        
        Spacer()
        
        NavigationLink(destination: {
          
          //action ke View Selanjutnya
          
        }, label: {
          Text("Iya")
            .font(.system(.body, design: .rounded))
            .fontWeight(.semibold)
            .foregroundColor(.black)
        })
        .frame(height: 35)
        .background(Color(UIColor(red: 1.00, green: 0.18, blue: 0.03, alpha: 1.00)))
        .cornerRadius(21)
        .padding(2)
        
        NavigationLink(destination: {
          
          //action ke View Selanjutnya
          
        }, label: {
          Text("Tidak")
            .font(.system(.body, design: .rounded))
            .fontWeight(.semibold)
            .foregroundColor(.white)
        })
        .frame(height: 35)
        .background(Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 1))
        .cornerRadius(21)
        .padding(2)
        .overlay(
          RoundedRectangle(cornerRadius: 21)
            .stroke(lineWidth: 3)
            .foregroundColor(Color(.sRGB, red: 0.33, green: 0.33, blue: 0.33, opacity: 1))
        )
      }
    }
  }
}

struct HelpConfirmationView_Previews: PreviewProvider {
  static var previews: some View {
    HelpConfirmationView()
  }
}
