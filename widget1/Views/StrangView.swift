import Foundation
import SwiftUI

struct StrangView: View {
    var date: Date
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                  //  Text("10:49 PM")
                    Text(date, style: .time)
                        .font(Font.custom("Fraunces-SemiBold", size: 35))
                       // .foregroundColor(.red1)
                        .kerning(-2)
                        //.background(Color.red.opacity(0.2))
                        //.blur(radius: 2)
                        .frame(width: 150)
                       // .shadow(color: .red, radius: 5, x: 0, y: 0)
                        .offset(y: 4)
                        .foregroundStyle(.linearGradient(colors: [ .red1, .red2,.red], startPoint: .top, endPoint: .bottom))
                      //  .blur(radius: 2)
                            
                    
                    
                }
                .padding(.top, 9)
               
                HStack(spacing: 5) {
                   // Text("Wednesday")
                    Text(date.day4())
                        .font(Font.custom("Fraunces-SemiBold", size: 20))
                        .kerning(-2)
                        .fontWeight(.bold)
                        .foregroundStyle(.linearGradient(colors: [ .red1, .red2,.red], startPoint: .top, endPoint: .bottom))
                        //.foregroundColor(.red1)
                        //.shadow(color: .red, radius: 5, x: 0, y: 0)
                        .offset(y: -25)
                      
                }
                .padding(.top, 10) // Reducido para acercar la fecha a la hora
                
            }
            
            Image("negro2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .position(x: 72, y: 80)
                .scaledToFill()
                .ignoresSafeArea()
             
              
        }
    }
}

struct StrangView_Previews: PreviewProvider {
    static var previews: some View {
        StrangView(date: Date())
    }
}
