//
//  ImageGridViewP.swift
//  C137
//
//  Created by Emmanuel Ortigoza Bordón on 2025-02-24.
//

import SwiftUICore
import SwiftUI

struct ImageGridViewP: View {
    @Binding var selectedGroup: Int?
    @Binding var selectedImageName: String
    @Binding var showAlert: Bool
    @Binding var loadingButtons: [String: Bool]
    @Binding var showConfirmationMessage: Bool
    @Binding var isEnglish: Bool
    var images: [String]
    var filteredImages: () -> [String]
    var selectImage: (String, Int) -> Void
    var interstitial: Interstitial?
    var rootViewController: () -> UIViewController

    var body: some View {
        ScrollView {
            Divider()
                .frame(height: 1)
                .background(Color.gris1)
                .padding(.horizontal, 1)
                .padding(.top, 3)
            
            Text(isEnglish ? "Pin \(selectedGroup ?? 1)" : "Pin \(selectedGroup ?? 1)")
                .foregroundColor(.white)
                .font(.headline)
                .fontWeight(.bold)
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(filteredImages(), id: \.self) { imageName in
                    ImageCellViewP(
                        imageName: imageName,
                        selectedImageName: $selectedImageName,
                        showAlert: $showAlert,
                        loadingButtons: $loadingButtons,
                        isEnglish: $isEnglish,
                        selectImage: selectImage,
                        interstitial: interstitial,
                        rootViewController: rootViewController,
                        selectedGroup: selectedGroup
                    )
                }
            }
            .padding()
        }
        .padding()
        .padding(.top, -15)
        .cornerRadius(3.0)
    }
}
