import Foundation
import SwiftUI

struct JamesView: View {
    var date: Date
    
    // Función para obtener la imagen de fondo basada en la hora actual
    func getImageNameForCurrentHour() -> String {
        let hour = Calendar.current.component(.hour, from: date) // Obtiene la hora actual (formato de 24 horas)
        return "\(hour)" // Devuelve el nombre de la imagen según la hora (ejemplo: "1", "2", ..., "24")
    }

    var body: some View {
        ZStack {
            // Imagen de fondo que cambia de acuerdo a la hora
            Image(getImageNameForCurrentHour()) // Usa la imagen que coincide con la hora
                .resizable()
                .scaledToFill() // Ajusta la imagen para cubrir todo el fondo
                .ignoresSafeArea() // Asegura que cubra todo el área, incluso debajo de las barras de estado y herramientas
            
            // Imagen degrada
                        Image("degra")
                            .resizable()
                            .padding(-17.0)
                            .aspectRatio(contentMode: .fit)
                            .scaledToFill()
                            .ignoresSafeArea()

            VStack {
                HStack {
                    
                    Text("\(date.amPm()).") // Aquí se agrega el punto
                        .font(Font.custom("Audiowide-Regular", size: 20))
                        .foregroundColor(.white)
                        //.kerning(-2)
                        .shadow(radius: 10)
                        .textCase(.uppercase)
                    
                    Text(date.hour2())
                        .font(Font.custom("Audiowide-Regular", size: 20))
                        .foregroundColor(.white)
                        //.kerning(-2)
                        .shadow(radius: 10)
                       
                    Text(":")
                        .font(Font.custom("Audiowide-Regular", size: 22))
                        .foregroundColor(.rojoc)
                        //.kerning(-2)
                        .shadow(radius: 10)
                    
                    Text(date.minute())
                        .font(Font.custom("Audiowide-Regular", size: 20))
                        .foregroundColor(.white)
                        //.kerning(-2)
                        .shadow(radius: 10)
                    
                       // .shadow(color: .black, radius: 3, x: 0, y: 0)
                }
                .padding(.top, -1)
                .offset(y: 60)
               
            }
            
        }
        .frame(maxWidth: 400, maxHeight: 400)
        .padding(.all, -20)
    }
}

struct JamesView_Previews: PreviewProvider {
    static var previews: some View {
        JamesView(date: Date())
    }
}
