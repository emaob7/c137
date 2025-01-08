//
//  FuckView.swift
//  C137
//
//  Created by Emmanuel Ortigoza Bordón on 2024-10-31.
//



import Foundation
// HiHiView.swift
import SwiftUI

struct FuckView: View {
    var date: Date
    
    var body: some View {
        ZStack {
            VStack (alignment: .leading, spacing: -10) {
                HStack  {
                    Text("THE HR")
                        .font(Font.custom("AmaticSC-Bold", size: 39))
                        .foregroundColor(.redt)

                    Text(date.hour2())
                        .font(Font.custom("AmaticSC-Bold", size: 39))
                        .foregroundColor(.redt)
                       // .frame(width: 45)
                    //    .shadow(radius: 10)

                }
               // .offset(y:12)
                
                HStack {
                    //Text("21")
                    Text("MIN**")
                        .font(Font.custom("AmaticSC-Bold", size: 39))
                        .foregroundColor(.redt)
                    Text(date.minute())
                        .font(Font.custom("AmaticSC-Bold", size: 39))
                      //  .frame(width: 54)
                        .foregroundColor(.redt)
                       
                }
                
                //.offset(y:-8)
                
                HStack {
                    //Text("21")
                    Text(date.amPm())
                        .font(Font.custom("AmaticSC-Bold", size: 40))
                      //  .frame(width: 54)
                        .foregroundColor(.redt)
                       
                }
                
              //  .offset(y:-19)
                
                
            }
            .rotationEffect(.degrees(-8)) // Aplica la rotación a todo el HStack
            .offset(x:6, y:-3)
            
        }
    }
}

struct FuckView_Previews: PreviewProvider {
    static var previews: some View {
        CallmeView(date: Date())
    }
}
