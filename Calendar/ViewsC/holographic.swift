import SwiftUI

struct holographic: View {
    var date: Date
   
    
    var body: some View {
        ZStack{

            
            VStack(spacing: 7) {
               
                HStack {
                    Text(date.day4())
                        .font(Font.custom("Fraunces-SemiBold", size: 28))
                        .kerning(-2)
                        .foregroundStyle(
                            .linearGradient(colors: [ .black,.black, .oscuro, .black], startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                }
                .padding(.top, 19)
                
                HStack {
                    Text(date.day())
                        .font(Font.custom("Fraunces-SemiBold", size: 100))
                        .kerning(-2)
                    // .foregroundColor(.black)
                        .foregroundStyle(
                            .linearGradient(colors: [ .black,.black, .oscuro, .black], startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                }
                .padding(.top, -14)
            }
            .frame(maxWidth: 400, maxHeight: 400)
            //.clipped() // Por si acaso, corta lo que se pase
        }
    }
}
