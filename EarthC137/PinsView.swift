import Foundation
import SwiftUI
import WidgetKit
import GoogleMobileAds

struct PinsView: View {
    @State private var searchText = ""
    @State private var showAlert = false
    @State private var selectedGroup: Int? = 1
    @State private var selectedImageName: String = ""
    @State private var groupImages: [Int: String] = [1: "", 2: "", 3: ""]
    @State private var loadingButtons: [String: Bool] = [:]
    @State private var showConfirmationMessage = false
    @State private var interstitial: Interstitial?
    @State private var showInstruModal = false
    
    
    // UserDefaults separados para cada grupo
    private let userDefaultsGroup1 = UserDefaults(suiteName: "group.artemis.EarthC137.Lock")
    private let userDefaultsGroup2 = UserDefaults(suiteName: "group.artemis.EarthC137.Lock2")
    private let userDefaultsGroup3 = UserDefaults(suiteName: "group.artemis.EarthC137.Lock3")
    
    private let images = ["dont touch","kanji turtle","hand bones","im doctor","im gammer","love cats","love dogs","atom","enso","robot","joystick","do better","handball","a football","football","rugby","tennis","love","one star", "no today", "game over","basketball","moon","psychology","soccer field","strengthtraining","volleyball 2","volleyball"]
    private let interstitialAdUnitID = "ca-app-pub-4622872693950947/9485573048"
    //private let interstitialAdUnitID = "ca-app-pub-3940256099942544/4411468910"
    
    var body: some View {
        NavigationView {
            VStack {
                // Encabezado con búsqueda
                HStack {
                    Image("c137trades")
                        .resizable()
                        .frame(width: 54, height: 54)
                        .padding(.leading, 3)
                    
                    Spacer()
                    
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
                .padding(.horizontal, 16)
                
                // Botones de grupo
                VStack {
                    HStack {
                        Text("Pins")
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Button(action: {
                            showInstruModal = true
                        }) {
                            Text("💡¿Instrucciones? toca aqui")
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
                    .padding(.top,10)
                }
                
                // Grid de imágenes
                ScrollView {
                    Divider()
                        .frame(height: 1)
                        .background(Color.gris1)
                        .padding(.horizontal, 1)
                        .padding(.top, 3)
                    
                    Text("Pin \(selectedGroup ?? 1)")
                        .foregroundColor(.white)
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(filteredImages(), id: \.self) { imageName in
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
                                    title: Text("Confirmación"),
                                    message: Text("¿Quieres transformar a \(selectedImageName)? aparecerá un anuncio para mantener la app gratuita"),
                                    primaryButton: .default(Text("Transformar")) {
                                        interstitial?.didDismissAd = {
                                            selectImage(selectedImageName, for: selectedGroup!)
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
                .padding(.top, -15)
                .cornerRadius(3.0)
                
                // Mensaje de confirmación
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
                // Cargar imágenes guardadas para cada grupo al iniciar
                groupImages[1] = userDefaultsGroup1?.string(forKey: "selectedImage") ?? ""
                groupImages[2] = userDefaultsGroup2?.string(forKey: "selectedImage") ?? ""
                groupImages[3] = userDefaultsGroup3?.string(forKey: "selectedImage") ?? ""
            }
            .background(Color.black.ignoresSafeArea())
            .animation(.easeInOut, value: showConfirmationMessage)
        }
    }
    
    // Filtrar imágenes basadas en la búsqueda
    private func filteredImages() -> [String] {
        if searchText.isEmpty {
            return images
        } else {
            return images.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    // Seleccionar y guardar imagen para un grupo específico
    private func selectImage(_ imageName: String, for group: Int) {
        loadingButtons[imageName] = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            groupImages[group] = imageName
            
            // Guardar la imagen en el UserDefaults correspondiente
            switch group {
            case 1:
                userDefaultsGroup1?.set(imageName, forKey: "selectedImage")
            case 2:
                userDefaultsGroup2?.set(imageName, forKey: "selectedImage")
            case 3:
                userDefaultsGroup3?.set(imageName, forKey: "selectedImage")
            default:
                break
            }
            
            WidgetCenter.shared.reloadAllTimelines()
            loadingButtons[imageName] = false
            showConfirmationMessage = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                showConfirmationMessage = false
            }
        }
    }
    
    // Obtener el controlador de vista raíz
    private func rootViewController() -> UIViewController {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return UIViewController()
        }
        return window.rootViewController ?? UIViewController()
    }
}

struct PinsView_Previews: PreviewProvider {
    static var previews: some View {
        PinsView()
    }
}
