//
//  DateSectionView.swift
//  C137
//
//  Created by Emmanuel Ortigoza Bordón on 2025-02-24.
//


import SwiftUI
import SwiftUICore

struct DateSectionView: View {
    @Binding var selectedImageName: String
    @Binding var showInstruModal: Bool
    @Binding var isEnglish: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) { // Asegura que los elementos dentro estén alineados a la izquierda
                Text(isEnglish ? "Date" :"Fecha")
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Image(selectedImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .cornerRadius(8)
                    .padding(3)
                    .overlay(
                        RoundedRectangle(cornerRadius: 11)
                            .stroke(Color.gray, lineWidth: 2)
                    )
            }
            .padding(.leading, 14)
            
            
            Spacer() // Empuja el texto a la derecha
            
            VStack(alignment: .leading, spacing: 8) { // VStack para alineación vertical
                
                
                // Botón de Instrucciones
                Button(action: {
                    showInstruModal = true
                }) {
                    Text(isEnglish ? "💡Guide?, tap here" :"💡¿Instrucciones? toca aqui")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
                .sheet(isPresented: $showInstruModal) {
                    InstruView()
                }
                
                
            }
            .padding(.trailing, 20) // Padding general para centrar el contenido
            .padding(.top, 10) // Espacio superior opcional
        }
        .padding(.horizontal, 35) // Espaciado en los costados
        
    }
}
