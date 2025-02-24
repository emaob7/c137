//
//  SearchBarView.swift
//  C137
//
//  Created by Emmanuel Ortigoza Bordón on 2025-02-23.
//
import SwiftUI
import SwiftUICore

struct SearchBarView: View {
    @Binding var searchText: String
    @Binding var showLanguageAlert: Bool
    @Binding var isEnglish: Bool

    var body: some View {
        HStack {
            Image("c137trades")
                .resizable()
                .frame(width: 54, height: 54)
                .padding(.leading, 3)

            Spacer()

            // Input de búsqueda con íconos
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.leading, 8)

                TextField(isEnglish ? "Search name" : "Buscar nombre", text: $searchText)
                    .padding(.vertical, 10)
                    .padding(.leading, 5)
                    .submitLabel(.done)

                if !searchText.isEmpty {
                    Button(action: {
                        searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 8)
                }
            }
            .frame(width: 235, height: 40)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color(.systemGray6)))
            .padding(.trailing, 10)

            // Botón para cambiar el idioma
            Button(action: {
                showLanguageAlert = true
            }) {
                Text(isEnglish ? "ES" : "EN")
                    .font(.system(size: 14))
                    .padding(11)
                    .background(Color(.systemGray6))
                    .foregroundColor(.blue)
                    .cornerRadius(20)
            }
            .alert(isPresented: $showLanguageAlert) {
                Alert(
                    title: Text(isEnglish ? "¿Cambiar idioma?" : "Change language?"),
                    message: Text(isEnglish ? "¿Quieres cambiar a Español 🇪🇸?" : "Do you want to switch to English 🇺🇸?"),
                    primaryButton: .default(Text(isEnglish ? "Si" : "Yes")) {
                        isEnglish.toggle()
                    },
                    secondaryButton: .destructive(Text("No"))
                )
            }
        }
        .padding(.horizontal, 16)
    }
}
