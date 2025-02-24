//
//  imageCellView.swift
//  C137
//
//  Created by Emmanuel Ortigoza Bordón on 2025-02-24.
//

import SwiftUICore
import UIKit
import SwiftUI
import WidgetKit


struct ImageCellView: View {
    var imageName: String
    @Binding var selectedImageName: String
    @Binding var showAlert: Bool
    @Binding var showDescriptionAlert: Bool
    @Binding var isEnglish: Bool
    @Binding var loadingButtons: [String: Bool]
    @Binding var showConfirmationMessage: Bool // Nuevo binding
    var imageDescriptions: [String: String]
    var interstitial: Interstitial?
    var rootViewController: () -> UIViewController

    var body: some View {
        VStack(spacing: 8) {
            Button(action: {
                selectedImageName = imageName
                showAlert = true
            }) {
                VStack {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                        .padding(7)
                        .overlay(
                            RoundedRectangle(cornerRadius: 26)
                                .stroke(Color.gris1, lineWidth: 3)
                        )
                }
                .padding()
                .padding(.bottom, -10)
                .background(Color(.systemBackground))
                .cornerRadius(10)
                .shadow(radius: 5)
                .overlay(
                    loadingButtons[imageName] == true ? ProgressView().progressViewStyle(CircularProgressViewStyle()).tint(.green) : nil
                )
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text(isEnglish ? "Accept?" : "Confirmación"),
                    message: Text(isEnglish ? "Do you want to convert to \(selectedImageName)? an ad will appear to keep the app free" : "¿Quieres transformar a \(selectedImageName)? aparecerá un anuncio para mantener la app gratuita"),
                    primaryButton: .default(Text(isEnglish ? "Transform" : "Aceptar")) {
                        interstitial?.didDismissAd = {
                            selectImage(selectedImageName)
                        }
                        interstitial?.showAd(from: rootViewController())
                    },
                    secondaryButton: .destructive(Text(isEnglish ? "Cancel" : "Cancelar"))
                    )
            }

            // Botón para mostrar la descripción
            Button(action: {
                selectedImageName = imageName
                showDescriptionAlert = true
            }) {
                Text(imageName)
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(2)
            }
            .alert(isPresented: $showDescriptionAlert) {
                Alert(
                    title: Text(isEnglish ? "Description" : "Descripción"),
                    message: Text(imageDescriptions[selectedImageName] ?? (isEnglish ? "No available" : "Descripción no disponible.")),
                    dismissButton: .default(Text(isEnglish ? "Close" : "Cerrar"))
                )
            }
        }
    }

    // Función para seleccionar una imagen
    private func selectImage(_ imageName: String) {
        loadingButtons[imageName] = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            UserDefaults(suiteName: "group.artemis.EarthC137.widget1")?.set(imageName, forKey: "selectedImage")
            WidgetCenter.shared.reloadAllTimelines()
            loadingButtons[imageName] = false
            showConfirmationMessage = true // Actualiza el estado para mostrar el mensaje

            // Ocultar el mensaje de confirmación después de 2 segundos
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                showConfirmationMessage = false
            }
        }
    }
}
