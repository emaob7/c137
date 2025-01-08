import SwiftUI
import Network
import WidgetKit
import GoogleMobileAds

struct ContentView: View {
   // @State private var interstitial: Interstitial?
    @State private var selectedTab = 0
    @State private var isConnected = true
    @State private var showingTermsAlert = false
    @State private var showingTermsSheet = false // Nuevo estado para mostrar el Sheet
    
    //private let interstitialAdUnitID = "ca-app-pub-3940256099942544/4411468910"
    private let monitor = NWPathMonitor()

    var body: some View {
        ZStack {
            if !isConnected {
                // Mensaje de no conexión a internet
                VStack {
                    Spacer()
                    Image(systemName: "wifi.slash")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.gray)
                        .padding(.bottom, 16)
                    
                    Text("Parece que estamos en la edad de piedra  🙃")
                        .font(.title)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.bottom, 32)
                    
                    Spacer()
                }
                .padding()

            } else {
                // Contenido principal
                TabView(selection: $selectedTab) {
                    ClockView()
                        .tabItem {
                            Label("Reloj", systemImage: "watchface.applewatch.case")
                        }
                        .tag(0)

                    CalendarView()
                        .tabItem {
                            Label("Fecha", systemImage: "7.square.fill")
                        }
                        .tag(1)

                    PinsView()
                        .tabItem {
                            Label("Pins", systemImage: "sparkles")
                        }
                        .tag(2)

                    SettingsView()
                        .tabItem {
                            Label("Settings", systemImage: "gear")
                        }
                        .tag(3)
                }
                .accentColor(.green)
                .background(
                           // Aplicar el efecto de desenfoque transparente a la barra inferior
                           VStack {
                               Spacer()
                               VisualEffectBlur(blurStyle: .systemUltraThinMaterial) // Efecto Blur de Apple
                                   .frame(height: 50)
                                   .edgesIgnoringSafeArea(.bottom) // Para que cubra toda la parte inferior
                           }
                       )
            }
        }
        .onAppear {
          //  interstitial = Interstitial(adUnitID: interstitialAdUnitID)
            startNetworkMonitor() // Inicia el monitor de red
            checkFirstLaunch() // Comprueba si es la primera vez que se usa la app
        }
        .alert(isPresented: $showingTermsAlert) {
            Alert(
                title: Text("Términos de Servicio"),
                message: Text("Debes aceptar los términos de servicio para usar esta aplicación. ¿Quieres leer los términos?"),
                primaryButton: .default(Text("Aceptar"), action: {
                    // Guarda que el usuario ha aceptado los términos
                    UserDefaults.standard.set(true, forKey: "hasAcceptedTerms")
                    showingTermsAlert = false // Cierra la alerta
                }),
                
                secondaryButton: .default(Text("Leer Términos"), action: {
                    showingTermsSheet = true // Muestra la hoja con los términos
                })
            )
        }
        .sheet(isPresented: $showingTermsSheet, onDismiss: {
            // Validar si aceptaron los términos después de cerrar el Sheet
            checkFirstLaunch()
        }) {
            TermsOfServiceView()
        }
    }
    
    private func startNetworkMonitor() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                isConnected = (path.status == .satisfied)
            }
        }
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }

    private func checkFirstLaunch() {
        let hasAcceptedTerms = UserDefaults.standard.bool(forKey: "hasAcceptedTerms")
        if !hasAcceptedTerms {
            showingTermsAlert = true
        }
    }

    struct VisualEffectBlur: UIViewRepresentable {
        var blurStyle: UIBlurEffect.Style

        func makeUIView(context: Context) -> UIVisualEffectView {
            let view = UIVisualEffectView(effect: UIBlurEffect(style: blurStyle))
            return view
        }

        func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
            uiView.effect = UIBlurEffect(style: blurStyle)
        }
    }
}
