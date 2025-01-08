//
//  HiHiView.swift
//  widget1Extension
//
//  Created by Emmanuel Ortigoza Bordón on 2024-08-26.
//

import Foundation
// HiHiView.swift
import SwiftUI

struct AstroView: View {
    var date: Date
    
    var body: some View {
        ZStack {
            VStack {
                HStack  {

                    Text(date.hour2())
                        .font(Font.custom("BebasNeue-Regular", size: 75))
                        .foregroundColor(.white)
                       // .frame(width: 45)
                        .shadow(radius: 10)

                }
                .offset(y:12)
                
                HStack {
                    //Text("21")
                    Text(date.minute())
                        .font(Font.custom("BebasNeue-Regular", size: 75))
                      //  .frame(width: 54)
                        .foregroundColor(.white)
                       
                }
                
                .offset(y:-8)
                
            }
            .offset(x:28)
            
            Image("astro1")
                .resizable()
                .aspectRatio(contentMode: .fit)
               .frame(width: 168, height: 168)
               .offset(x:-6, y:-6)
                .scaledToFill()
                .ignoresSafeArea()
        }
    }
}

struct AstroView_Previews: PreviewProvider {
    static var previews: some View {
        HiHiView(date: Date())
    }
}
