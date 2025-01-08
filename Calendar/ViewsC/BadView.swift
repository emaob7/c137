//
//  Bad.swift
//  C137
//
//  Created by Emmanuel Ortigoza Bordón on 2024-10-07.
//



import Foundation
import SwiftUI

struct BadView: View {
    var date: Date
    
    var body: some View {
        ZStack {

            VStack (spacing: -9){
               
                HStack {
                                  Text(date.month3()) // Mes a la izquierda
                                        .font(.system(size: 16))
                                      .foregroundColor(.verbad)
                                      .padding(.leading, 27) // Ajusta el padding si es necesario
                                      .fontWeight(.bold)
                                  
                                  Spacer() // Para empujar el año a la derecha
                                  
                                  Text(date.year()) // Año a la derecha
                                    .font(.system(size: 16))
                                      .foregroundColor(.verbad)
                                      .padding(.trailing, 27) // Ajusta el padding si es necesario
                                      .fontWeight(.bold)
                              }
                            //  .padding(.top, 18) //
                
                HStack {
                     //Text("6")
                    Text(date.day())
                        .font(.system(size: 93))
                        .fontWeight(.bold)
                       .fontDesign(.rounded)
                        .foregroundColor(.verbad)
                }
               // .padding(.top, -18)
                HStack {
                    Text(date.day4())
                        .font(.system(size: 16))
                        .foregroundColor(.verbad)
                        .fontWeight(.bold)
                       // .textCase(.uppercase)

                }
               // .padding(.top, 5)
               
            }
            .padding(.top, -2)
            /*
            Image("patron")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 220, height: 220)
                .position(x: 72, y: 90)
                .scaledToFill()
                .ignoresSafeArea()
             */
        }
        .frame(maxWidth: 400, maxHeight: 400)
        .padding(.all,-20)
    }
}

struct BadView_Previews: PreviewProvider {
    static var previews: some View {
        BadView(date: Date())
    }
}
