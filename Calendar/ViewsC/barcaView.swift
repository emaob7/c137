//
//  barcaView.swift
//  CalendarExtension
//
//  Created by Emmanuel Ortigoza Bordón on 2024-09-24.
//

import Foundation
import SwiftUI

struct barcaView: View {
    var date: Date
    
    var body: some View {
        ZStack {
            // Fondo rojo que cubre todo el área
          /*  Color.white
            .ignoresSafeArea()
           */// Esto asegura que cubra todo el área, incluso debajo de las barras de estado y de herramientas

            VStack (spacing: 10){
               
                HStack {
                   // Text("WED.")
                    Text("\(date.day2()).")
                        .font(Font.custom("BebasNeue-Regular", size: 32))
                        .foregroundColor(.yellowca)
                        .fontWeight(.bold)
                   // Text("JUN.")
                    Text("\(date.month3()).")
                        .font(Font.custom("BebasNeue-Regular", size: 32))
                        .foregroundColor(.yellowca)
                        .fontWeight(.bold)
                
                       
                }
                .padding(.top, 30) // Reducido para acercar la fecha a la hora
                HStack {
                   //  Text("24")
                    Text(date.day())
                        .font(Font.custom("BebasNeue-Regular", size: 104))
                        .foregroundColor(.yellowca)
                       // .frame(width: 150)
                      
                       // .offset(y: 4)
                }
                .padding(.top, -19)
               
            }
            .padding(.top, -25)
            Image("text")
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

struct barcaView_Previews: PreviewProvider {
    static var previews: some View {
        barcaView(date: Date())
    }
}
