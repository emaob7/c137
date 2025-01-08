import Foundation
import SwiftUI

struct WantedView: View {
    var date: Date
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                   // Text("Wednesday")
                    Text(date.day4())
                        .font(Font.custom("Fraunces-SemiBold", size: 20))
                      //  .fontWeight(.bold)
                        .foregroundColor(.marron)
                        .offset(y: -14)
                        .textCase(.uppercase)
                    
                      
                } // Reducido para acercar la fecha a la hora
                HStack {
                   // Text("10")
                  Text(date.hour2())
                        .font(Font.custom("Teko-SemiBold", size: 60))
                        .foregroundStyle(.linearGradient(colors: [.azul1, .azul2], startPoint: .top, endPoint: .bottom))
                        .offset(y: -10)
                        .shadow(color: .black, radius: 1, x: 1, y: 1)
                        //.shadow(radius: 1)
                    Text(":")
                        .font(Font.custom("Teko-SemiBold", size: 60)).foregroundColor(.rojo1)
                        .offset(y: -10)
                        .shadow(color: .black, radius: 1, x: 1, y: 1)
                   // Text("37")
                    Text(date.minute())
                        .font(Font.custom("Teko-SemiBold", size: 60))
                        .foregroundStyle(.linearGradient(colors: [.azul1, .azul2], startPoint: .top, endPoint: .bottom))
                        .offset(y: -10)
                        .shadow(color: .black, radius: 1, x: 1, y: 1)
                }
                .padding(-14)
                
                HStack {
                  //  Text("10:49 PM")
                    Text("B")
                        .font(Font.custom("Fraunces-SemiBold", size: 16))
                        .foregroundColor(.marron)
                        .offset(y: 12)
                   // Text("37")
                    Text(date.formattedDate())
                        .font(Font.custom("Fraunces-SemiBold", size: 15))
                        .foregroundColor(.marron)
                        .offset(y: 12)
                }
               
              
                
            }
            
            
             
        }
    }
}


