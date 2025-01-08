//
//  bratView.swift
//  C137
//
//  Created by Emmanuel Ortigoza Bordón on 2024-12-18.
//

import Foundation
import SwiftUI

struct bratView: View {
    var date: Date
    
    var body: some View {
        ZStack {
           
            VStack {
                
                HStack {
                     //Text("00:00 PM")
                    Text(date, style: .time)
                        .font(Font.custom("BebasNeue-Regular", size: 32))
                        .foregroundColor(.black)
                       
                }
               
               
            }
            
            
            
        
        }
       
        
      //  .padding(.top,-65)
    }
   
}

