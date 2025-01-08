//
//  MadridView.swift
//  CalendarExtension
//
//  Created by Emmanuel Ortigoza Bordón on 2024-09-24.


import Foundation
import SwiftUI

struct MadridView: View {
    var date: Date
    
    var body: some View {
        ZStack {
            // Fondo rojo que cubre todo el área
          /*  Color.white
            .ignoresSafeArea()
           */// Esto asegura que cubra todo el área, incluso debajo de las barras de estado y de herramientas

            VStack (spacing: 10){
               
                HStack {
                    //Text("TUESDAY")
                    Text(date.day4())
                        .font(Font.custom("Philosopher-Bold", size: 21))
                        .foregroundColor(.madrid)
                        .fontWeight(.bold)
                        .textCase(.uppercase)
                   // Text("JUN.")
                  /* Text("\(date.month3()).")
                        .font(Font.custom("Philosopher-Bold", size: 28))
                        .foregroundColor(.madrid)
                        .fontWeight(.bold)
                        .textCase(.uppercase)
                */
                       
                }
                .padding(.top, 31) // Reducido para acercar la fecha a la hora
                HStack {
                     //Text("6")
                    Text(date.day())
                        .font(Font.custom("Philosopher-Bold", size: 105))
                        .foregroundColor(.madrid)
                       // .frame(width: 150)
                      
                       // .offset(y: 4)
                }
                .padding(.top, -18)
               
            }
            .padding(.top, -25)
            Image("patron")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 220, height: 220)
                .position(x: 72, y: 90)
                .scaledToFill()
                .ignoresSafeArea()
        }
        .frame(maxWidth: 400, maxHeight: 400)
        .padding(.all,-20)
    }
}

struct MadridView_Previews: PreviewProvider {
    static var previews: some View {
        MadridView(date: Date())
    }
}
