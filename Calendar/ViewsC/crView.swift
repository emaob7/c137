//
//  barcaView.swift
//  CalendarExtension
//
//  Created by Emmanuel Ortigoza Bordón on 2024-09-24.
//

import Foundation
import SwiftUI

struct crView: View {
    var date: Date
    
    var body: some View {
        ZStack {
            // Fondo rojo que cubre todo el área
          /*  Color.white
            .ignoresSafeArea()
           */// Esto asegura que cubra todo el área, incluso debajo de las barras de estado y de herramientas

            VStack (spacing: 5){
               
                HStack {
                   // Text("TUE.")
                    Text("\(date.day2()).")
                        .font(Font.custom("BebasNeue-Regular", size: 32))
                        .foregroundColor(.madrid2)
                        .fontWeight(.bold)
                    //Text("FEB.")
                    Text("\(date.month3()).")
                        .font(Font.custom("BebasNeue-Regular", size: 32))
                        .foregroundColor(.madrid2)
                        .fontWeight(.bold)
                
                       
                }
                .background(
                           Color.white // Fondo blanco
                               .cornerRadius(10) // Bordes redondeados (opcional)
                               .padding(-10) // Padding negativo para ajustar mejor el fondo al texto
                       )
                .padding(.top, 28) // Reducido para acercar la fecha a la hora
                HStack {
                     //Text("5")
                    Text(date.day())
                        .font(Font.custom("BebasNeue-Regular", size: 115))
                        .foregroundColor(.madrid2)
                        .shadow(color: .madrid2.opacity(0.8), radius: 0, x: 2, y: 0) // Sombra hacia la derecha
                       // .frame(width: 150)
                      
                       // .offset(y: 4)
                }
                .padding(.top, -19)
               
            }
            .padding(.top, -12)
        }
        .frame(maxWidth: 400, maxHeight: 400)
        .padding(.all,-20)
    }
}

struct crView_Previews: PreviewProvider {
    static var previews: some View {
        crView(date: Date())
    }
}
