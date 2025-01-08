

//
//  windowsView.swift
//  widget1Extension
//
//  Created by Emmanuel Ortigoza Bordón on 2024-09-25.
//

import Foundation
import SwiftUI

struct MarceView: View {
    var date: Date
    
    var body: some View {
        ZStack {
           
            VStack {
                
                HStack (spacing: 3)  {
                    Text(date.hour2())
                        .font(Font.custom("HomemadeApple-Regular", size: 48))
                        .foregroundColor(.black)
                        .shadow(radius: 10)
                        
                    Text(":")
                        .font(Font.custom("HomemadeApple-Regular", size: 48))
                        .foregroundColor(.black)
                        .shadow(radius: 10)
                        
                  
                    Text(date.minute())
                        .font(Font.custom("HomemadeApple-Regular", size: 48))
                        .foregroundColor(.black)
                        .shadow(radius: 10)

                }
                .padding(.top, 4)
                
             
            }

            
            
            
          
        
        }
       
        
        .padding(.top,-65)
    }
   
}

struct MarceView_Previews: PreviewProvider {
    static var previews: some View {
        windowsView(date: Date())
    }
}
