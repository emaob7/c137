//
//  Bayern.swift
//  CalendarExtension
//
//  Created by Emmanuel Ortigoza Bordón on 2024-09-25.
import Foundation
import SwiftUI

struct BayernView: View {
    var date: Date
    
    var body: some View {
        ZStack {
            VStack (spacing: 10){
                // Aquí reemplazamos el nombre del día por la vista de texto curvado
                CurvedText(text: date.day4(), radius: 150)
                    .padding(.top, 31) // Reducido para acercar la fecha a la hora

                HStack {
                    // Text("6")
                    Text(date.day())
                        .font(Font.custom("Philosopher-Bold", size: 105))
                        .foregroundColor(.madrid)
                       // .frame(width: 150)
                       // .offset(y: 4)
                }
                .padding(.top, -18)
            }
            .padding(.top, -25)
        }
        .frame(maxWidth: 400, maxHeight: 400)
        .padding(.all,-20)
    }
}

struct CurvedText: View {
    var text: String
    var radius: CGFloat = 100 // Radio del arco
    
    var body: some View {
        ZStack {
            ForEach(Array(text.enumerated()), id: \.offset) { index, letter in
                Text(String(letter))
                    .font(Font.custom("Philosopher-Bold", size: 21))
                    .foregroundColor(.madrid)
                    .fontWeight(.bold)
                    .textCase(.uppercase)
                    .position(x: xPosition(index: index, total: text.count),
                              y: yPosition(index: index, total: text.count))
                    .rotationEffect(angleForLetter(index: index, total: text.count))
            }
        }
        .frame(width: radius * 2, height: radius * 2)
    }
    
    // Cálculo de la posición en X para cada letra
    func xPosition(index: Int, total: Int) -> CGFloat {
        let angle = angleForLetter(index: index, total: total)
        return radius + cos(angle) * radius
    }

    // Cálculo de la posición en Y para cada letra
    func yPosition(index: Int, total: Int) -> CGFloat {
        let angle = angleForLetter(index: index, total: total)
        return radius + sin(angle) * radius
    }
    
    // Cálculo del ángulo de cada letra en radianes
    func angleForLetter(index: Int, total: Int) -> Angle {
        let fraction = Double(index) / Double(total - 1)
        return Angle(degrees: fraction * 180 - 90) // Arco desde -90° a 90°
    }
}

struct MadridView_Previews: PreviewProvider {
    static var previews: some View {
        MadridView(date: Date())
    }
}
