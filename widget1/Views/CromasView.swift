//
//  CromasView.swift
//  widget1Extension
//
//  Created by Emmanuel Ortigoza Bordón on 2024-08-31.
//


import Foundation
// HiHiView.swift
import SwiftUI

struct CromasView: View {
    var date: Date
    
    var body: some View {
        ZStack {
            VStack {
                HStack  {
                    //  Spacer(minLength: 15)
                  //  Text("wednesday")
                    Text(date.day4())
                        .font(Font.custom("Teko-SemiBold", size: 20))
                        .foregroundColor(.rojoc)
                        .frame(width: 100)
                        .textCase(.uppercase)
                        .offset(x:24, y: -20)
                    // .shadow(radius: 1)
                }
                
                HStack (spacing: -7) {
                  //  Spacer(minLength: 15)
                    //Text("01")
                    Text(date.hour2())
                        .font(Font.custom("Teko-SemiBold", size: 40))
                        .foregroundColor(.rojoc)
                        .frame(width: 45)
                       // .shadow(radius: 1)
                        
                   // Text("37")
                     Text(" l ")
                        .font(Font.custom("Teko-SemiBold", size: 51))
                        .foregroundColor(.yellowc)
                        .offset( y: 14)
                        .kerning(-5)
                      //  .padding(.leading, 2)
                     //Text("37")
                    Text(date.minute())
                        .font(Font.custom("Teko-SemiBold", size: 40))
                       // .shadow(radius: 1)
                        .frame(width: 54)
                        .foregroundColor(.rojoc)
                        
                    
                }
                .offset(x:27, y: 2)
               // .padding(.top, -32)
                
               
            }
            
            Image("bolsillo")
                .resizable()
                .padding(-17.0)
                .aspectRatio(contentMode: .fit)
                //.frame(width: 180, height: 180)
               // .position(x: 72, y: 80)
                .scaledToFill()
                .ignoresSafeArea()
        }
    }
}

struct CromasView_Previews: PreviewProvider {
    static var previews: some View {
        CromasView(date: Date())
    }
}
