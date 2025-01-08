//
//  haView.swift
//  C137
//
//  Created by Emmanuel Ortigoza Bordón on 2024-10-27.
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

struct haView: View {
    var date: Date
    
    var body: some View {
        ZStack {
            VStack {
                HStack  {

                    Text(date.hour2())
                        .font(Font.custom("RubikWetPaint-Regular", size: 60))
                        .foregroundStyle(.linearGradient(colors: [ .pink, .purple, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing))
                       // .frame(width: 45)
                        .shadow(radius: 10)

                }
                .offset(x:-50,y:-3)
                
                HStack {
                    //Text("21")
                    Text(date.minute())
                        .font(Font.custom("RubikWetPaint-Regular", size: 60))
                      //  .frame(width: 54)
                        .foregroundStyle(.linearGradient(colors: [ .red,.orange, .yellowc], startPoint: .topLeading, endPoint: .bottomTrailing))
                       
                }
                
                .offset(y:-4)
                
            }
            .offset(x:25)
            
            Image("halloo")
                .resizable()
                //.aspectRatio(contentMode: .fit)
              // .frame(width: 168, height: 168)
              // .offset(x:-6, y:-6)
                .scaledToFill()
                .ignoresSafeArea()
        }
    }
}

