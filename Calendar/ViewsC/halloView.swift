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

struct halloView: View {
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
                    Text(date.month())
                       // .font(Font.custom("PlaywriteDESAS-Regular", size: 23))
                       // .foregroundColor(.white)
                       // .fontWeight(.bold)
                        .font(Font.custom("RubikWetPaint-Regular", size: 22))
                        
                        .foregroundStyle(.linearGradient(colors: [  .purple, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing))
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
                .offset(y: -11)// Reducido para acercar la fecha a la hora
                HStack {
                    // Text("00:00 PM")
                    Text(date.day())
                        .font(.system(size: 87))
                        .fontWeight(.bold)
                       .fontDesign(.rounded)
                      //  .frame(width: 54)
                        .foregroundStyle(.linearGradient(colors: [ .red,.na1, .na2, .na3], startPoint: .topLeading, endPoint: .bottomTrailing))
                    /*
                       .foregroundStyle(.linearGradient(colors: [ .yellow, .orange, .red, .indigo,.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                     
                      */
                }
                .padding(.top, -18)
                .offset(y: -10)
               
            }
            
            Image("hallo")
                .resizable()
               // .padding(-17.0)
                .aspectRatio(contentMode: .fit)
               // .frame(width: 130, height: 130)
               // .position(x: 100, y: 90)
                .scaledToFill()
                .ignoresSafeArea()
             
        }
        .frame(maxWidth: 400, maxHeight: 400)
        .padding(.all,-20)
    }
}

