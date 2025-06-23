//
//  CalendarView.swift
//  C137
//
//  Created by Emmanuel Ortigoza Bordón on 2024-09-15.
//



import Foundation
import SwiftUI
import WidgetKit
import GoogleMobileAds

struct CalendarView: View {
    @State private var searchText = ""
    @State private var showAlert = false
    @State private var selectedImageName = UserDefaults(suiteName: "group.artemis.EarthC137.Calendar")?.string(forKey: "selectedImage") ?? "new york"
    @State private var loadingButtons: [String: Bool] = [:]
    @State private var showConfirmationMessage = false
    @State private var showLanguageAlert = false
    @State private var interstitial: Interstitial?
    @State private var showInstruModal = false
    @State private var showDescriptionAlert = false
    @AppStorage("isEnglish", store: UserDefaults(suiteName: "group.artemis.EarthC137.isEnglish"))
    
    private var isEnglish: Bool = false
    private let userDefaults = UserDefaults(suiteName: "group.artemis.EarthC137.Calendar")
    private let images = ["holographic","new york","yellow name","barrilete cosmico","garra guarani","11 day","fire","hello","bad design","1902","1987","sky"]
   // private let interstitialAdUnitID = "ca-app-pub-4622872693950947/1407772472"
    private let interstitialAdUnitID = "ca-app-pub-3940256099942544/4411468910" //
    
    private let imageDescriptions: [String: String] = [:]
    
  
    
    var body: some View {
        NavigationView {
        
            VStack {
                // Título estilo iOS
                // Barra de búsqueda y botón de idioma
                SearchBarView(searchText: $searchText, showLanguageAlert: $showLanguageAlert, isEnglish: $isEnglish)

                
                // Sección del reloj y las instrucciones
                DateSectionView(selectedImageName: $selectedImageName, showInstruModal: $showInstruModal, isEnglish: $isEnglish)


                // Cuadrícula de imágenes
                ImageGridViewC(
                    selectedImageName: $selectedImageName,
                    showAlert: $showAlert,
                    showDescriptionAlert: $showDescriptionAlert,
                    isEnglish: $isEnglish,
                 //   showConfirmationMessage: $showConfirmationMessage, // Pasar el estado
                    images: images,
                    imageDescriptions: imageDescriptions,
                    filteredImages: filteredImages
                )
            }
            .background(Color.black.ignoresSafeArea())
        }
    }

    // Función para filtrar imágenes
    private func filteredImages() -> [String] {
        if searchText.isEmpty {
            return images
        } else {
            return images.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
