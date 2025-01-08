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

struct cartoonView: View {
    var date: Date
    
    var body: some View {
        ZStack {
            VStack {
                HStack  {
                    Text(date, style: .time)
                        .font(Font.custom("SourGummy-Bold", size: 34))
                        .foregroundColor(.black)
                        .offset( y: -25)
                        
                    
                 

                }
                
                HStack {
                    Text(date.day4())
                        .font(Font.custom("SourGummy-Bold", size: 18))
                        .foregroundColor(.black)

                    
                }
                
                .offset(y: -18)
            }
            .padding(.top, -11)
            
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

