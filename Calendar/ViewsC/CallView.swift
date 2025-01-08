//
//  CallView.swift
//  CalendarExtension
//
//  Created by Emmanuel Ortigoza Bordón on 2024-09-20.
//
//
//  CincelView.swift
//  CalendarExtension
//
//  Created by Emmanuel Ortigoza Bordón on 2024-09-19.
//

import Foundation
import SwiftUI

struct CallView: View {
    var date: Date
    
    var body: some View {
        ZStack {
            // Fondo rojo que cubre todo el área
          /*  Color.white
            .ignoresSafeArea()
           */// Esto asegura que cubra todo el área, incluso debajo de las barras de estado y de herramientas

            VStack (spacing: -10){
               
                HStack {
                   // Text("WEDNESDAY")
                    Text("\(date.day2()).")
                        .font(Font.custom("RockSalt-Regular", size: 20))
                        .foregroundColor(.yellowca)
                        .fontWeight(.bold)
                    Text("\(date.month3()).")
                        .font(Font.custom("RockSalt-Regular", size: 20))
                        .foregroundColor(.yellowca)
                        .fontWeight(.bold)
                
                       
                }
                .padding(.top, 30) // Reducido para acercar la fecha a la hora
                HStack {
                    // Text("00:00 PM")
                    Text(date.day())
                        .font(Font.custom("RockSalt-Regular", size: 55))
                        .foregroundColor(.yellowca)
                       // .frame(width: 150)
                      
                       // .offset(y: 4)
                }
                .padding(.top, -19)
               
            }
            .padding(.top, -25)
        }
        .frame(maxWidth: 400, maxHeight: 400)
        .padding(.all,-20)
    }
}

struct CallView_Previews: PreviewProvider {
    static var previews: some View {
        CallView(date: Date())
    }
}
