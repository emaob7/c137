import Foundation
import SwiftUI

struct CieloView: View {
    var date: Date
    
    var body: some View {
        ZStack {
           
            VStack {
                HStack {
                     //Text("00:00 PM")
                    Text(date, style: .time)
                        .font(Font.custom("Fredoka-Medium", size: 38))
                        .foregroundColor(.tuneye2)
                        .shadow(radius: 2)
                        //.kerning(-2)
                       // .frame(width: 150)
                       // .shadow(color: .yellow, radius: 3, x: 0, y: 0)
                       // .offset(y: 4)
                }
               
                HStack {
                   // Text("Wednesday")
                    Text(date.day4())
                        .font(Font.custom("Fredoka-Medium", size: 25))
                        .kerning(-1)
                        .shadow(radius: 2)
                        //.fontWeight(.bold)
                        .foregroundColor(.tuneye2)
                       // .shadow(color: .yellow, radius: 3, x: 0, y: 0)
                        .offset(y: -5)
                }
                 // Reducido para acercar la fecha a la hora
            }
            
            Image("parody sky2")
                .resizable()
                .padding(-17.0)
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 130)
                .position(x: 100, y: 90)
                .scaledToFill()
                .ignoresSafeArea()
        }
        .frame(maxWidth: 400, maxHeight: 400)
        .padding(.all,-20)
    }
}

struct CieloView_Previews: PreviewProvider {
    static var previews: some View {
        CieloView(date: Date())
    }
}
