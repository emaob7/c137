//
//  vanView.swift
//  widget1Extension
//
//  Created by Emmanuel Ortigoza Bordón on 2024-09-26.
//

import Foundation
import SwiftUI

struct vanView: View {
    var date: Date
    
    // Función para obtener la imagen de fondo basada en la hora actual
    func getImageNameForCurrentHour() -> String {
        let hour = Calendar.current.component(.hour, from: date) // Obtiene la hora actual (formato de 24 horas)
        let adjustedHour = hour + 25 // Suma 24 para obtener los números entre 25 y 48
        return "\(adjustedHour)" // Devuelve el nombre de la imagen según la nueva hora (ejemplo: "25", "26", ..., "48")
    }

    var body: some View {
        ZStack {
            // Imagen de fondo que cambia de acuerdo a la hora ajustada
            Image(getImageNameForCurrentHour()) // Usa la imagen que coincide con la hora ajustada
                .resizable()
                .scaledToFill() // Ajusta la imagen para cubrir todo el fondo
                .ignoresSafeArea() // Asegura que cubra todo el área, incluso debajo de las barras de estado y herramientas
            
            // Imagen degrada
            VStack {
                HStack {
                    Text(date, style: .time)
                        .font(Font.custom("Philosopher-Bold", size: 26))
                        .foregroundColor(.black)
                        .shadow(radius: 10)
                        .textCase(.uppercase)
                }
                .padding(.top, -1)
                .offset(y: 58)
            }
        }
        .frame(maxWidth: 400, maxHeight: 400)
        .padding(.all, -20)
    }
}

struct vanView_Previews: PreviewProvider {
    static var previews: some View {
        vanView(date: Date())
    }
}
