//
//  ImageCellViewP.swift
//  C137
//
//  Created by Emmanuel Ortigoza Bordón on 2025-02-24.
//

import SwiftUICore
import UIKit
import SwiftUI


struct ImageCellViewP: View {
    var imageName: String
    @Binding var selectedImageName: String
    @Binding var showAlert: Bool
    @Binding var loadingButtons: [String: Bool]
    @Binding var isEnglish: Bool
    var selectImage: (String, Int) -> Void
    var interstitial: Interstitial?
    var rootViewController: () -> UIViewController
    var selectedGroup: Int?

    var body: some View {
        Button(action: {
            if selectedGroup != nil {
                selectedImageName = imageName
                showAlert = true
            }
        }) {
            VStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .padding(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gris1, lineWidth: 2)
                    )
                Text(imageName)
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(.top, 2)
            }
            .padding(8)
            .background(Color(.systemBackground))
            .cornerRadius(10)
            .shadow(radius: 5)
            .overlay(
                loadingButtons[imageName] == true ? ProgressView().progressViewStyle(CircularProgressViewStyle()).tint(.green) : nil
            )
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(isEnglish ? "Confirmation" : "Confirmación"),
                message: Text(isEnglish ? "Do you want to transform to \(selectedImageName)? An ad will appear to keep the app free." : "¿Quieres transformar a \(selectedImageName)? Aparecerá un anuncio para mantener la app gratuita."),
                primaryButton: .default(Text(isEnglish ? "Transform" : "Transformar")) {
                    interstitial?.didDismissAd = {
                        selectImage(selectedImageName, selectedGroup!)
                    }
                    interstitial?.showAd(from: rootViewController())
                },
                secondaryButton: .destructive(Text(isEnglish ? "Cancel" : "Cancelar"))
            )
        }
    }
}
