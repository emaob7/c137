//
//  design.swift
//  C137
//
//  Created by Emmanuel Ortigoza Bordón on 2024-10-21.
//

//
//  helloView.swift
//  CalendarExtension
//
//  Created by Emmanuel Ortigoza Bordón on 2024-09-20.
//


import Foundation
import SwiftUI

struct designView: View {
    var date: Date
    
    var body: some View {
        ZStack {
            // Fondo rojo que cubre todo el área
           // Color.black
            //.ignoresSafeArea()
           // Esto asegura que cubra todo el área, incluso debajo de las barras de estado y de herramientas

            VStack (spacing: 7){
               
                HStack {
                   // Text("WEDNESDAY")
                    Text(date.day4())
                        .foregroundColor(.red)
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                       .fontDesign(.rounded)
                       // .font(Font.custom("PlaywriteDESAS-Regular", size: 22))
                       // .foregroundColor(.white)
                    /*
                        .foregroundStyle(.linearGradient(colors: [ .yellow, .orange, .red, .indigo,.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                     */
                      
                    /*
                    Text("\(date.month3()).")
                        .font(Font.custom("PlaywriteDESAS-Regular", size: 23))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                */
                       
                }
                .padding(.top, 12)
                .offset(y: -20)// Reducido para acercar la fecha a la hora
                HStack {
                    // Text("00:00 PM")
                    Text(date.day())
                        .foregroundColor(.black)
                        .font(.system(size: 80))
                        .fontWeight(.bold)
                       .fontDesign(.rounded)
                    /*
                       .foregroundStyle(.linearGradient(colors: [ .yellow, .orange, .red, .indigo,.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                     
                      */
                }
                .padding(.top, -15)
                .offset(y: 5)
               
            }
        }
        .frame(maxWidth: 400, maxHeight: 400)
        .padding(.all,-20)
    }
}

struct designView_Previews: PreviewProvider {
    static var previews: some View {
        designView(date: Date())
    }
}
