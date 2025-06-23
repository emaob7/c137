import Foundation
import SwiftUI

struct newView: View {
    var date: Date
    
    var body: some View {
        ZStack {
            // Fondo rojo que cubre todo el área
            Color.white
            .ignoresSafeArea()  // Esto asegura que cubra todo el área, incluso debajo de las barras de estado y de herramientas

            VStack (spacing: 6){
               
                HStack {
                   // Text("WEDNESDAY")
                    Text(date.day4())
                        .font(Font.custom("UnifrakturMaguntia", size: 28))
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                       
                }
                .padding(.top, 25) // Reducido para acercar la fecha a la hora
                HStack {
                    // Text("00:00 PM")
                    Text(date.day())
                        .font(Font.custom("UnifrakturMaguntia", size: 128))
                        .foregroundColor(.black)
                       // .frame(width: 150)
                      
                       // .offset(y: 4)
                }
                .padding(.top, -9)
               
            }
        }
        .frame(maxWidth: 400, maxHeight: 400)
        .padding(.all,-20)
    }
}

