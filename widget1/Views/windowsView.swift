//
//  windowsView.swift
//  widget1Extension
//
//  Created by Emmanuel Ortigoza Bordón on 2024-09-25.
//

import Foundation
import SwiftUI

struct windowsView: View {
    var date: Date
    
    var body: some View {
        ZStack {
           
            VStack {
                
                HStack {
                     //Text("00:00 PM")
                    Text(date, style: .time)
                        .font(Font.custom("Fredoka-Medium", size: 32))
                        .foregroundColor(.white)
                       // .shadow(radius: 2)
                        //.kerning(-2)
                       // .frame(width: 150)
                       // .shadow(color: .yellow, radius: 3, x: 0, y: 0)
                       // .offset(y: 4)
                }
               /*
                HStack {
                   // Text("Wednesday")
                    Text(date.day4())
                        .font(Font.custom("Fredoka-Medium", size: 22))
                        .kerning(-1)
                        //.shadow(radius: 2)
                        //.fontWeight(.bold)
                        .foregroundColor(.white)
                       // .shadow(color: .yellow, radius: 3, x: 0, y: 0)
                        .offset(y: -5)
                }
                 // Reducido para acercar la fecha a la hora
                */
               
            }
            
            
            
        
        }
       
        
        .padding(.top,-65)
    }
   
}

struct windowsView_Previews: PreviewProvider {
    static var previews: some View {
        windowsView(date: Date())
    }
}
