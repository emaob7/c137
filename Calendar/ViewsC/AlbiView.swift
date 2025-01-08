//
//  Untitled.swift
//  C137
//
//  Created by Emmanuel Ortigoza Bordón on 2024-11-12.
//


import Foundation
import SwiftUI

struct AlbiView: View {
    var date: Date
    
    var body: some View {
        ZStack {
            // Fondo rojo que cubre todo el área
            VStack (spacing: 6){
               
                HStack {
                    //Text("Wednesday")
                    Text(date.day4())
                        .font(Font.custom("BebasNeue-Regular", size: 30))
                        .foregroundColor(.azul2)
                        .textCase(.uppercase)
                        .offset(y: 5)
                       // .shadow(color: .black, radius: 0, x: -1, y: 1)
                }
                .padding(.top, 10) // Reducido para acercar la fecha a la hora
                HStack {
                    // Text("00:00 PM")
                    Text(date.day())
                        .font(Font.custom("Teko-SemiBold", size: 115))
                        .foregroundColor(.azul2)
                       // .shadow(color: .black, radius: 0, x: -1, y: 1)
                       // .frame(width: 150)
                        .offset(y: 10)
                }
                .padding(.top, -40)
               
            }
        }
        .frame(maxWidth: 400, maxHeight: 400)
        .padding(.all,-20)
    }
}


