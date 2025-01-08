//
//  helloView.swift
//  CalendarExtension
//
//  Created by Emmanuel Ortigoza Bordón on 2024-09-20.
//


import Foundation
import SwiftUI

struct helloView: View {
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
                    Text("\(date.day4()).")
                        .font(Font.custom("PlaywriteDESAS-Regular", size: 23))
                       // .foregroundColor(.white)
                        .fontWeight(.bold)
                        .foregroundStyle(.linearGradient(colors: [ .yellow, .orange, .red, .indigo,.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                      
                    /*
                    Text("\(date.month3()).")
                        .font(Font.custom("PlaywriteDESAS-Regular", size: 23))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                */
                       
                }
                .padding(.top, 12) // Reducido para acercar la fecha a la hora
                HStack {
                    // Text("00:00 PM")
                    Text(date.day())
                        .foregroundColor(.white)
                        .font(.system(size: 105))
                        .fontWeight(.bold)
                       .fontDesign(.rounded)
                    /*
                       .foregroundStyle(.linearGradient(colors: [ .yellow, .orange, .red, .indigo,.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                     
                      */
                }
                .padding(.top, -19)
               
            }
        }
        .frame(maxWidth: 400, maxHeight: 400)
        .padding(.all,-20)
    }
}

struct helloView_Previews: PreviewProvider {
    static var previews: some View {
        helloView(date: Date())
    }
}
