import SwiftUI
import GoogleMobileAds
import WidgetKit

struct ImageGridView: View {
    @Binding var selectedImageName: String
    @Binding var showAlert: Bool
    @Binding var showDescriptionAlert: Bool
    @Binding var isEnglish: Bool
    //@Binding var showConfirmationMessage: Bool // Nuevo binding
    var images: [String]
    var imageDescriptions: [String: String]
    var filteredImages: () -> [String]

    // Propiedades relacionadas con AdMob
    
    @State private var interstitial: Interstitial?
    @State private var showConfirmationMessage = false
    @State private var loadingButtons: [String: Bool] = [:]
   
    private let interstitialAdUnitID = "ca-app-pub-4622872693950947/5863361532"
      // private let interstitialAdUnitID = "ca-app-pub-3940256099942544/4411468910" //

    var body: some View {
        ScrollView {
       /*     Divider()
                .frame(height: 1)
                .background(Color.gris1)
                .padding(.horizontal, 1)
                .padding(.top, 3)
*/
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(filteredImages(), id: \.self) { imageName in
                    ImageCellView(
                        imageName: imageName,
                        selectedImageName: $selectedImageName,
                        showAlert: $showAlert,
                        showDescriptionAlert: $showDescriptionAlert,
                        isEnglish: $isEnglish,
                        loadingButtons: $loadingButtons,
                        showConfirmationMessage: $showConfirmationMessage, // Pasar el binding
                        imageDescriptions: imageDescriptions,
                        interstitial: interstitial,
                        rootViewController: rootViewController
                    )
                }
            }
            .padding()
        }
        .padding()
        .padding(.top, -15)
        .cornerRadius(3.0)
        .onAppear {
            interstitial = Interstitial(adUnitID: interstitialAdUnitID)
        }
        .overlay(
            showConfirmationMessage ? ConfirmationMessageView(isEnglish: $isEnglish) : nil
        )
    }

    // Función para obtener el controlador de vista raíz
    private func rootViewController() -> UIViewController {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return UIViewController()
        }
        return window.rootViewController ?? UIViewController()
    }
}
