//
//  ClockSectionView.swift
//  C137
//
//  Created by Emmanuel Ortigoza Bordón on 2025-02-23.
//
import SwiftUI
import SwiftUICore

struct ClockSectionView: View {
    @Binding var selectedImageName: String
    @Binding var showInstruModal: Bool
    @Binding var isEnglish: Bool

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(isEnglish ? "Clock" : "Reloj")
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

            Spacer()

            VStack(alignment: .leading, spacing: 8) {
                // Botón de Instrucciones
                Button(action: {
                    showInstruModal = true
                }) {
                    Text(isEnglish ? "💡Guide?, tap here" : "💡¿Instrucciones? toca aqui")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
                .sheet(isPresented: $showInstruModal) {
                    InstruView()
                }

                Text(isEnglish ? "✅ New! Tap the widget name to see its description." : "✅ Nuevo! Toca el nombre del widget para ver su descripción.")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.horizontal, 22)
                    .padding(.leading, -24)
            }
            .padding(.leading, 20)
            .padding(.top, 10)
        }
        .padding(.horizontal, 35)
    }
}
