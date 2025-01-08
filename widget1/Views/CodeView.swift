import SwiftUI

struct CodeView: View {
    var date: Date
    
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 5) {
                HStack(spacing: 3) { // Reducir el espacio entre los Texts en este HStack
                    Text("let")
                        .font(Font.custom("RobotoMono-Regular", size: 16))
                        .foregroundColor(.lila)
                    Text("Hr")
                        .font(Font.custom("RobotoMono-Regular", size: 16))
                        .foregroundColor(.celeste)
                    Text(":")
                        .font(Font.custom("RobotoMono-Regular", size: 16))
                        .foregroundColor(.white)
                    
                    Text(date.hour())
                        .font(Font.custom("RobotoMono-Regular", size: 16))
                        .foregroundColor(.naranja)
                        .shadow(radius: 10)
                }
                
                HStack(spacing: 3) { // Reducir el espacio entre los Texts en este HStack
                    Text("let")
                        .font(Font.custom("RobotoMono-Regular", size: 16))
                        .foregroundColor(.lila)
                    Text("Min")
                        .font(Font.custom("RobotoMono-Regular", size: 16))
                        .foregroundColor(.celeste)
                    Text(":")
                        .font(Font.custom("RobotoMono-Regular", size: 16))
                        .foregroundColor(.white)
                    
                    Text(date.minute())
                        .font(Font.custom("RobotoMono-Regular", size: 16))
                        .foregroundColor(.naranja)
                        .shadow(radius: 10)
                }
                
                HStack(spacing: 3) { // Reducir el espacio entre los Texts en este HStack
                    Text("let")
                        .font(Font.custom("RobotoMono-Regular", size: 16))
                        .foregroundColor(.lila)
                    Text("Day")
                        .font(Font.custom("RobotoMono-Regular", size: 16))
                        .foregroundColor(.celeste)
                    Text(":")
                        .font(Font.custom("RobotoMono-Regular", size: 16))
                        .foregroundColor(.white)
                    
                    Text("\"\(date.day2())\"")
                        .font(Font.custom("RobotoMono-Regular", size: 16))
                        .foregroundColor(.purple)
                        .shadow(radius: 10)
                }
                
                HStack(spacing: 3) { // Reducir el espacio entre los Texts en este HStack
                    Text("let")
                        .font(Font.custom("RobotoMono-Regular", size: 16))
                        .foregroundColor(.lila)
                    Text("MM")
                        .font(Font.custom("RobotoMono-Regular", size: 16))
                        .foregroundColor(.celeste)
                    Text(":")
                        .font(Font.custom("RobotoMono-Regular", size: 16))
                        .foregroundColor(.white)
                    
                    Text("\"\(date.month3())\"")
                        .font(Font.custom("RobotoMono-Regular", size: 16))
                        .foregroundColor(.purple)
                        .shadow(radius: 10)
                }
                
                HStack(spacing: 3) { // Reducir el espacio entre los Texts en este HStack
                    Text("let")
                        .font(Font.custom("RobotoMono-Regular", size: 16))
                        .foregroundColor(.lila)
                    Text("YY")
                        .font(Font.custom("RobotoMono-Regular", size: 16))
                        .foregroundColor(.celeste)
                    Text(":")
                        .font(Font.custom("RobotoMono-Regular", size: 16))
                        .foregroundColor(.white)
                    
                    Text(date.year())
                        .font(Font.custom("RobotoMono-Regular", size: 16))
                        .foregroundColor(.naranja)
                        .shadow(radius: 10)
                }
            }
            .padding(.leading, 14)
            .padding(.top, 15) // Añade más espacio en la parte superior del VStack
        }
    }
}

struct CodeView_Previews: PreviewProvider {
    static var previews: some View {
        CodeView(date: Date())
    }
}
