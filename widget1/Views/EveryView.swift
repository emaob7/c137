//
//  EveryView.swift
//  widget1Extension
//
//  Created by Emmanuel Ortigoza Bordón on 2024-08-29.
//

import Foundation
import SwiftUI

struct EveryView: View {
    var date: Date
    
    var body: some View {
        ZStack {
          

            VStack {
                HStack {
                    // Text("00:00 PM")
                    Text(date, style: .time)
                        .font(Font.custom("DSEG7ModernMini-Italic", size: 23))
                        .foregroundColor(.celeste)
                        .kerning(-1)
                       // .frame(width: 150)
                        .shadow(color: .teal, radius: 3, x: 0, y: 0)
                       // .offset(y: 4)
                }
                .padding(.top, -21)
               
                HStack(spacing: 5) {
                   // Text("WEDNESDAY")
                    Text(date.day4())
                        .font(.system(size: 15))
                        .fontWeight(.light)
                        .fontDesign(.rounded)
                        .foregroundColor(.white)
                        .kerning(-1)
                        .offset(y: 3)
                        .textCase(.uppercase)
                }
                .padding(.top, 25) // Reducido para acercar la fecha a la hora
            }
        }
       
    }
}

struct EveryView_Previews: PreviewProvider {
    static var previews: some View {
        EveryView(date: Date())
    }
}
