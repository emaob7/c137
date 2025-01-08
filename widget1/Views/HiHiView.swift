//
//  HiHiView.swift
//  widget1Extension
//
//  Created by Emmanuel Ortigoza Bordón on 2024-08-26.
//

import Foundation
// HiHiView.swift
import SwiftUI

struct HiHiView: View {
    var date: Date
    
    var body: some View {
        ZStack {
            VStack {
                HStack (spacing: 3)  {
                    Text(date.hour2())
                        .font(Font.custom("CabinSketch-Bold", size: 47))
                        .foregroundColor(.white)
                        
                        .shadow(radius: 10)
                        .offset( y: 8)
                    
                    Text(":")
                        .font(Font.custom("Hi-Regular", size: 40))
                        .foregroundColor(.white)
                        .shadow(radius: 10)
                        .offset( y: 8)
                    Text(date.minute())
                        .font(Font.custom("CabinSketch-Bold", size: 47))
                        .foregroundColor(.white)
                        .offset( y: 8)

                }
                .padding(.top, 4)
                .frame(width: 150)
                
                HStack(spacing: 5) {
                    Text("[\(date.day())")
                        .font(Font.custom("PatrickHand-Regular", size: 18))
                        .fontWeight(.regular)
                        .foregroundColor(.hear2)

                    // Texto del mes con corchetes
                    Text("\(date.month())]")
                        .font(Font.custom("PatrickHand-Regular", size: 18))
                        .fontWeight(.regular)
                        .foregroundColor(.hear2)
                        .textCase(.uppercase)
                }
                .padding(.top, 4)
                .offset(y: -12)
            }
           /*
            Image("hi")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 220, height: 220)
                .position(x: 72, y: 90)
                .scaledToFill()
                .ignoresSafeArea()
            */
        }
    }
}

struct HiHiView_Previews: PreviewProvider {
    static var previews: some View {
        HiHiView(date: Date())
    }
}
