//
//  new york.swift
//  C137
//
//  Created by Emmanuel Ortigoza Bordón on 2024-09-19.
//

import Foundation
import SwiftUI

struct TuneView: View {
    var date: Date
    
    var body: some View {
        ZStack {
            // Fondo rojo que cubre todo el área
            Color.tuneYe
            .ignoresSafeArea()  // Esto asegura que cubra todo el área, incluso debajo de las barras de estado y de herramientas

            VStack {
                HStack {
                    // Text("00:00 PM")
                    Text(date, style: .time)
                        .font(Font.custom("DSEG7ModernMini-Bold", size: 30))
                        .foregroundColor(.tuneye2)
                        .kerning(-2)
                       // .frame(width: 150)
                        .shadow(color: .yellow, radius: 3, x: 0, y: 0)
                       // .offset(y: 4)
                }
                .padding(.top, -9)
               
                HStack(spacing: 5) {
                   // Text("WEDNESDAY")
                    Text(date.day4())
                        .font(Font.custom("DSEG7ModernMini-Bold", size: 15))
                        .kerning(-2)
                        .fontWeight(.bold)
                        .foregroundColor(.tuneye2)
                        .shadow(color: .yellow, radius: 3, x: 0, y: 0)
                        .offset(y: -10)
                }
                .padding(.top, 25) // Reducido para acercar la fecha a la hora
            }
        }
        .frame(maxWidth: 400, maxHeight: 400)
        .padding(.all,-20)
    }
}

struct TuneView_Previews: PreviewProvider {
    static var previews: some View {
        TuneView(date: Date())
    }
}
