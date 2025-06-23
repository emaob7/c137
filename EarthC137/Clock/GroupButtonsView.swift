//
//  GroupButtonsView.swift
//  C137
//
//  Created by Emmanuel Ortigoza Bordón on 2025-02-24.
//

import SwiftUICore
import SwiftUI

struct GroupButtonsView: View {
    @Binding var selectedGroup: Int?
    @Binding var groupImages: [Int: String]
    @Binding var showInstruModal: Bool
    @Binding var isEnglish: Bool

    var body: some View {
        VStack {
            HStack {
                Text(isEnglish ? "Pins" :"Pines")
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button(action: {
                    showInstruModal = true
                }) {
                    Text(isEnglish ? "💡Guide? Tap here" : "💡¿Instrucciones? toca aqui")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
                .sheet(isPresented: $showInstruModal) {
                    instrucView()
                }
            }
            .padding(.horizontal, 40)
            
            HStack(spacing: 20) {
                ForEach(1..<4) { group in
                    Button(action: {
                        selectedGroup = group
                    }) {
                        Image(groupImages[group] ?? "")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .cornerRadius(5)
                            .padding(3)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(selectedGroup == group ? Color.blue : Color.gray, lineWidth: 2)
                            )
                    }
                }
            }
            .padding(.horizontal, 40)
            .padding(.top, 10)
        }
    }
}
