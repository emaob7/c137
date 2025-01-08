//
//  PinsView.swift
//  C137
//
//  Created by Emmanuel Ortigoza Bordón on 2024-09-15.
//

import Foundation
import SwiftUI
import WidgetKit
import GoogleMobileAds

struct PinsView: View {
    @State private var searchText = ""
    @State private var showAlert = false
    @State private var selectedImageName = ""
    @State private var loadingButtons: [String: Bool] = [:]
    @State private var showConfirmationMessage = false
    @State private var interstitial: Interstitial?
    @State private var showInstruModal = false // Estado para mostrar el modal de instrucciones
    
    private let userDefaults = UserDefaults(suiteName: "group.artemis.EarthC137.Lock")
    
    private let images = ["dont touch","kanji turtle","hand bones","im doctor","im gammer","love cats","love dogs","atom","enso","robot","joystick","do better","handball","a football","football","rugby","tennis","love","one star", "no today", "game over","basketball","moon","psychology","soccer field","strengthtraining","volleyball 2","volleyball"]
     private let interstitialAdUnitID = "ca-app-pub-4622872693950947/9485573048"
   // private let interstitialAdUnitID = "ca-app-pub-3940256099942544/4411468910" //
    


  
    
    var body: some View {
        NavigationView {
        
        VStack {
            // Título estilo iOS
            HStack {
                           
                HStack {
                                   Image("c137trades")
                                       .resizable()
                                       .frame(width: 54, height: 54) // Ajusta el tamaño según sea necesario
                                      // .padding(.top)
                                       .padding(.leading,-29)
                               }
                               .frame(width: 10)
            
            // Input de búsqueda con íconos
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.leading, 8)
                
                TextField("Buscar", text: $searchText)
                    .padding(.vertical, 10)
                    .padding(.leading, 5)
                
                if !searchText.isEmpty {
                    Button(action: {
                        searchText = ""
                  //      AnalyticsManager.shared.logButtonPress(buttonName: "clear_search")
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 8)
                }
            }
            .frame(width: 250.0, height: 40.0)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color(.systemGray6)))
            .padding(.horizontal, 29.0)
            .padding(.trailing,-56)
            
            }
            
            
            ScrollView {
                Divider()
                               .frame(height: 1) // Ajusta el grosor de la línea
                               .background(Color.gris1) // Color de la línea
                               .padding(.horizontal, 29.0)
                               .padding(.top,3)
               
                
                VStack(alignment: .leading, spacing: 8) { // VStack para alineación vertical
                    Text("Lock Pin #1")
                        .foregroundColor(.white)
                        .font(.title2)
                        .fontWeight(.bold)
                      //  .padding(.leading, 16) // Ajusta el espacio según necesites
                    
                    // Botón de Instrucciones
                    Button(action: {
                        showInstruModal = true
                    }) {
                        Text("💡¿Instrucciones? toca aqui")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                    .sheet(isPresented: $showInstruModal) {
                        instrucView()
                    }
                    
                    
                    
                }
                .padding(.leading, -110) // Padding general para centrar el contenido
                .padding(.top, 10) // Espacio superior opcional
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(filteredImages(), id: \.self) { imageName in
                        Button(action: {
                            selectedImageName = imageName
                            showAlert = true
                       //     AnalyticsManager.shared.logButtonPress(buttonName: imageName)
                        }) {
                            VStack {
                                Image(imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(20)
                                    .padding(5) // Ajusta el padding para reducir el espacio
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.gris1, lineWidth: 2) // Borde más delgado si es necesario
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
                                title: Text("Confirmación"),
                                message: Text("¿Quieres transformar a \(selectedImageName)? aparecerá un anuncio para mantener la app gratuita"),
                                primaryButton: .default(Text("Transformar")) {
                                    interstitial?.didDismissAd = {
                                        selectImage(selectedImageName)
                                    }
                                    interstitial?.showAd(from: rootViewController())
                                },
                                secondaryButton: .destructive(Text("Cancelar"))
                            )
                        }
                    }
                }
                .padding()
            }
            .padding()
            .padding(.top,-15)
            .cornerRadius(3.0)
            
            if showConfirmationMessage {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                    Text("¡Listo!")
                        .fontWeight(.bold)
                }
                .transition(.opacity)
                .padding()
            }
        }
        .onAppear {
            interstitial = Interstitial(adUnitID: interstitialAdUnitID)
        }
        .background(Color.black.ignoresSafeArea())
        .animation(.easeInOut, value: showConfirmationMessage)
        //.colorScheme(.dark) // Forzar modo oscuro
    }
}
        
        private func filteredImages() -> [String] {
            if searchText.isEmpty {
                return images
            } else {
                return images.filter { $0.contains(searchText.lowercased()) }
            }
        }
        
    private func selectImage(_ imageName: String) {
        loadingButtons[imageName] = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            userDefaults?.set(imageName, forKey: "selectedImage")
            
              //  print("Imagen guardada en UserDefaults: \(imageName)")
            

            WidgetCenter.shared.reloadAllTimelines()
            loadingButtons[imageName] = false
            showConfirmationMessage = true
            
            // Ocultar el mensaje de confirmación después de 2 segundos
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                showConfirmationMessage = false
            }
        }
    }


    }
    
    private func rootViewController() -> UIViewController {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return UIViewController() // Devuelve un controlador vacío si no se encuentra ninguno
        }
        return window.rootViewController ?? UIViewController()
    }

    
    struct PinsView_Previews: PreviewProvider {
        static var previews: some View {
            PinsView()
        }
    }




