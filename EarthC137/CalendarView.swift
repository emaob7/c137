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
    @State private var selectedImageName = UserDefaults(suiteName: "group.artemis.EarthC137.Calendar")?.string(forKey: "selectedImage") ?? ""
    @State private var loadingButtons: [String: Bool] = [:]
    @State private var showConfirmationMessage = false
    @State private var interstitial: Interstitial?
    @State private var showInstruModal = false
    
    private let userDefaults = UserDefaults(suiteName: "group.artemis.EarthC137.Calendar")
    private let images = ["new york","yellow name","barrilete cosmico","garra guarani","11 day","fire","hello","bad design","1902","1987","sky"]
    private let interstitialAdUnitID = "ca-app-pub-4622872693950947/1407772472"
    //private let interstitialAdUnitID = "ca-app-pub-3940256099942544/4411468910" //
    
    
    
  
    
    var body: some View {
        NavigationView {
        
            VStack {
                // Título estilo iOS
                HStack {
                    Image("c137trades")
                        .resizable()
                        .frame(width: 54, height: 54) // Ajusta el tamaño según sea necesario
                        .padding(.leading,3)

                    Spacer() // Empuja los elementos a los extremos

                    // Input de búsqueda con íconos
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.leading, 8)
                        
                        TextField("Buscar nombre", text: $searchText)
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
                    .frame(width: 295, height: 40)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color(.systemGray6)))
                    .padding(.trailing, 10)
                }
                .padding(.horizontal, 16) // Espacio en los costados

                
                HStack {
                    VStack(alignment: .leading) { // Asegura que los elementos dentro estén alineados a la izquierda
                        Text("Fecha")
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.bold)

                        Image(selectedImageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .cornerRadius(5)
                            .padding(3)
                            .overlay(
                                RoundedRectangle(cornerRadius: 9)
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
                            Text("💡¿Instrucciones? toca aqui")
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

            ScrollView {
                Divider()
                               .frame(height: 1) // Ajusta el grosor de la línea
                               .background(Color.gris1) // Color de la línea
                               .padding(.horizontal, 1)
                               .padding(.top,3)

                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(filteredImages(), id: \.self) { imageName in
                        Button(action: {
                            selectedImageName = imageName
                            showAlert = true
                    //        AnalyticsManager.shared.logButtonPress(buttonName: imageName)
                        }) {
                            VStack {
                                Image(imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(20)
                                    .padding(7) // Espacio entre la imagen y el borde
                                    .overlay( // Capa para el borde gris
                                                      RoundedRectangle(cornerRadius: 26)
                                                        .stroke(Color.gris1, lineWidth: 3)
                                                      // Borde gris de 3 puntos de ancho
                                                  )
                                 
                                Text(imageName)
                                    .font(.caption)
                                    .foregroundColor(.white)
                                    .padding(.top,2)
                                
                                
                            }
                            .padding()
                            .padding(.bottom,-10)
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

    
    struct CalendarView_Previews: PreviewProvider {
        static var previews: some View {
            CalendarView()
        }
    }




