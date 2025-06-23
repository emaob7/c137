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
    @State private var showLanguageAlert = false
    @AppStorage("isEnglish", store: UserDefaults(suiteName: "group.artemis.EarthC137.isEnglish"))
    private var isEnglish: Bool = false
    
    
    // UserDefaults separados para cada grupo
    private let userDefaultsGroup1 = UserDefaults(suiteName: "group.artemis.EarthC137.Lock")
    private let userDefaultsGroup2 = UserDefaults(suiteName: "group.artemis.EarthC137.Lock2")
    private let userDefaultsGroup3 = UserDefaults(suiteName: "group.artemis.EarthC137.Lock3")
    
    private let images = ["aura","play","astronaut","astro","straw hat","dont touch","kanji turtle","hand bones","im doctor","im gammer","love cats","love dogs","atom","enso","robot","joystick","do better","handball","a football","football","rugby","tennis","love","one star", "no today", "game over","basketball","moon","psychology","soccer field","strengthtraining","volleyball 2","volleyball"]
    private let interstitialAdUnitID = "ca-app-pub-4622872693950947/9485573048"
    //private let interstitialAdUnitID = "ca-app-pub-3940256099942544/4411468910"
    
    var body: some View {
        NavigationView {
            VStack {
                // Encabezado con búsqueda
                // Barra de búsqueda y botón de idioma
                SearchBarView(searchText: $searchText, showLanguageAlert: $showLanguageAlert, isEnglish: $isEnglish)
                
                // Botones de grupo
                               GroupButtonsView(
                                   selectedGroup: $selectedGroup,
                                   groupImages: $groupImages,
                                   showInstruModal: $showInstruModal,
                                   isEnglish: $isEnglish
                               )

                // Grid de imágenes
                               ImageGridViewP(
                                   selectedGroup: $selectedGroup,
                                   selectedImageName: $selectedImageName,
                                   showAlert: $showAlert,
                                   loadingButtons: $loadingButtons,
                                   showConfirmationMessage: $showConfirmationMessage,
                                   isEnglish: $isEnglish,
                                   images: images,
                                   filteredImages: filteredImages,
                                   selectImage: selectImage,
                                   interstitial: interstitial,
                                   rootViewController: rootViewController
                               )

                               // Mensaje de confirmación
                               .overlay(
                                   showConfirmationMessage ? ConfirmationMessageView(isEnglish: $isEnglish) : nil
                               )
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
                           
                           DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
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
