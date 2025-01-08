//
//  helloView.swift
//  CalendarExtension
//
//  Created by Emmanuel Ortigoza Bordón on 2024-09-20.
//


import Foundation
import SwiftUI

struct onceView: View {
    var date: Date
    
    var body: some View {
        ZStack {
            // Fondo rojo que cubre todo el área
            Color.black
            .ignoresSafeArea()
           // Esto asegura que cubra todo el área, incluso debajo de las barras de estado y de herramientas

            VStack (spacing: 7){
               
                HStack {
                   // Text("WEDNESDAY")
                    Text((date.day4()))
                        .font(Font.custom("Fraunces-SemiBold", size: 28))
                       // .foregroundColor(.red1)
                        .kerning(-2)
                       // .shadow(color: .red, radius: 5, x: 0, y: 0)
                        .foregroundStyle(.linearGradient(colors: [ .red1, .red2,.red], startPoint: .top, endPoint: .bottom))
                    /*
                    Text("\(date.month3()).")
                        .font(Font.custom("PlaywriteDESAS-Regular", size: 23))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                */
                       
                }
                
                .padding(.top, 19) // Reducido para acercar la fecha a la hora
                HStack {
                    // Text("00:00 PM")
                    Text(date.day())
                        .font(Font.custom("Fraunces-SemiBold", size: 100))
                       // .foregroundColor(.red1)
                        .kerning(-2)
                      //  .shadow(color: .red, radius: 2, x: 0, y: 0)
                    
                        .foregroundStyle(.linearGradient(colors: [ .red1, .red2,.red,.red1], startPoint: .top, endPoint: .bottom))
                     
                      
                }
                .padding(.top, -14)
               
            }
            
        }
        .frame(maxWidth: 400, maxHeight: 400)
        .padding(.all,-20)
    }
}

struct onceView_Previews: PreviewProvider {
    static var previews: some View {
        onceView(date: Date())
    }
}
