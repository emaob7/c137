//
//  blueView.swift
//  C137
//
//  Created by Emmanuel Ortigoza Bordón on 2024-11-11.
//

import Foundation
import SwiftUI

struct orangeView: View {
    var date: Date
    
    var body: some View {
        ZStack {
            // Fondo rojo que cubre todo el área
            VStack (spacing: 22){
               
                HStack {
                    //Text("Wednesday")
                    Text(date.day4())
                        .font(Font.custom("Tourney-ExtraBold", size: 22))
                        .foregroundColor(.black)
                        .textCase(.uppercase)
                       // .shadow(color: .black, radius: 0, x: -1, y: 1)
                }
                .padding(.top, 10) // Reducido para acercar la fecha a la hora
                HStack {
                    // Text("10")
                    Text(date.day())
                        .font(Font.custom("Tourney-ExtraBold", size: 110))
                        .foregroundColor(.black)
                       // .shadow(color: .black, radius: 0, x: -1, y: 1)
                       // .frame(width: 150)
                       // .offset(y: 4)
                }
                .padding(.top, -30)
               
            }
        }
        .frame(maxWidth: 400, maxHeight: 400)
        .padding(.all,-20)
    }
}


