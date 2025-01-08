//
//  CallmeView.swift
//  widget1Extension
//
//  Created by Emmanuel Ortigoza Bordón on 2024-09-20.
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

struct CallmeView: View {
    var date: Date
    
    var body: some View {
        ZStack {
            VStack {
                HStack  {
                    Text("Hr")
                        .font(Font.custom("RockSalt-Regular", size: 24))
                        .foregroundColor(.yellowca)

                    Text(date.hour2())
                        .font(Font.custom("RockSalt-Regular", size: 25))
                        .foregroundColor(.yellowca)
                       // .frame(width: 45)
                    //    .shadow(radius: 10)

                }
                .offset(y:12)
                
                HStack {
                    //Text("21")
                    Text("Min")
                        .font(Font.custom("RockSalt-Regular", size: 21))
                        .foregroundColor(.yellowca)
                    Text(date.minute())
                        .font(Font.custom("RockSalt-Regular", size: 24))
                      //  .frame(width: 54)
                        .foregroundColor(.yellowca)
                       
                }
                
                .offset(y:-8)
                
                HStack {
                    //Text("21")
                    Text(date.amPm())
                        .font(Font.custom("RockSalt-Regular", size: 21))
                      //  .frame(width: 54)
                        .foregroundColor(.yellowca)
                       
                }
                
                .offset(y:-19)
                
                
            }
           // .offset(x:28)
            
        }
    }
}

struct CallmeView_Previews: PreviewProvider {
    static var previews: some View {
        CallmeView(date: Date())
    }
}
