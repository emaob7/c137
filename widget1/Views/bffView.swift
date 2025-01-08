//
//  bffView.swift
//  C137
//
//  Created by Emmanuel Ortigoza Bordón on 2024-11-04.
//

//
//  HiHiView.swift
//  widget1Extension
//
//  Created by Emmanuel Ortigoza Bordón on 2024-08-26.
//

import Foundation
// HiHiView.swift
import SwiftUI

struct bffView: View {
    var date: Date
    
    var body: some View {
        ZStack {
            VStack {
                HStack (spacing: 3)  {
                    Text(date.hour2())
                        .font(Font.custom("AmaticSC-Bold", size: 67))
                        .foregroundColor(.white)
                        .shadow(radius: 10)
                        .offset( y: 8)
                        .kerning(15)
                    
                  /*  Text(":")
                        .font(Font.custom("AmaticSC-Bold", size: 58))
                        .foregroundColor(.black)
                        .shadow(radius: 10)
                        .offset( y: 8)
                        .kerning(3)
                   */
                    Text(date.minute())
                        .font(Font.custom("AmaticSC-Bold", size: 67))
                        .foregroundColor(.white)
                        .offset( y: 8)
                        .kerning(15)

                }
                .padding(.top, 4)
                .padding(.leading,9)
                .frame(width: 170)
                
                HStack(spacing: 5) {
                    Text(date.day())
                        .font(Font.custom("PatrickHand-Regular", size: 18))
                        .fontWeight(.regular)
                        .foregroundColor(.white)

                    // Texto del mes con corchetes
                    Text(date.month())
                        .font(Font.custom("PatrickHand-Regular", size: 18))
                        .fontWeight(.regular)
                        .foregroundColor(.white)
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

struct bffView_Previews: PreviewProvider {
    static var previews: some View {
        bffView(date: Date())
    }
}
