import SwiftUI
import Network
import WidgetKit
import GoogleMobileAds
import UserNotifications

struct ContentView: View {
   // @State private var interstitial: Interstitial?
    
    @State private var selectedTab = 0
    @State private var isConnected = true
    @State private var showingTermsAlert = false
    @State private var showingTermsSheet = false // Nuevo estado para mostrar el Sheet
    @State private var showingInstruView = false // Nuevo estado para mostrar el modal de InstruView
    @AppStorage("isEnglish", store: UserDefaults(suiteName: "group.artemis.EarthC137.isEnglish"))
    private var isEnglish: Bool = false
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
                    
                    Text(isEnglish ? "It seems we are in the stone age 🙃" :"Parece que estamos en la edad de piedra  🙃")
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
                ZStack {
                                    // Fondo semi-transparente para la barra de pestañas
                                    VisualEffectBlur(blurStyle: .systemUltraThinMaterial)
                                        .frame(height: 50) // Altura de la barra de pestañas
                                        .edgesIgnoringSafeArea(.bottom) // Extender hasta el borde inferior
                                    
                                    // TabView
                TabView(selection: $selectedTab) {
                    ClockView()
                        .tabItem {
                            Label(isEnglish ? "Clock" :"Reloj", systemImage: "watchface.applewatch.case")
                        }
                        .tag(0)

                    CalendarView()
                        .tabItem {
                            Label(isEnglish ? "Date" :"Fecha", systemImage: "7.square.fill")
                        }
                        .tag(1)

                    PinsView()
                        .tabItem {
                            Label("Pins", systemImage: "sparkles")
                        }
                        .tag(2)

                    SettingsView()
                        .tabItem {
                            Label(isEnglish ? "Settings" :"Ajustes", systemImage: "gear")
                        }
                        .tag(3)
                }
                .accentColor(.green)
              
            }
        }
        }
            
        .onAppear {
          //  interstitial = Interstitial(adUnitID: interstitialAdUnitID)
            startNetworkMonitor() // Inicia el monitor de red
            checkFirstLaunch() // Comprueba si es la primera vez que se usa la app
            requestNotificationPermission() // Solicitar permiso para notificaciones
            UserDefaults.standard.set(true, forKey: "shouldShowUpdateNotification")
            checkForAppUpdate() // Verificar si hay una actualización
        }
        .alert(isPresented: $showingTermsAlert) {
            Alert(
                title: Text(isEnglish ? "Terms of Service" :"Términos de Servicio"),
                message: Text(isEnglish ? "You must accept the terms of service to use this application. Do you want to read the terms?" :"Debes aceptar los términos de servicio para usar esta aplicación. ¿Quieres leer los términos?"),
                primaryButton: .default(Text(isEnglish ? "Accept":"Aceptar"), action: {
                    // Guarda que el usuario ha aceptado los términos
                    UserDefaults.standard.set(true, forKey: "hasAcceptedTerms")
                    showingTermsAlert = false // Cierra la alerta
                    showingInstruView = true // Muestra el modal de InstruView
                }),
                
                secondaryButton: .default(Text(isEnglish ? "Read Terms":"Leer Términos"), action: {
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
        .sheet(isPresented: $showingInstruView) {
                    InstruView() // Muestra la vista InstruView en un modal
                }
    }
    
    
    private func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                print("Permiso para notificaciones concedido")
            } else if let error = error {
                print("Error al solicitar permiso: \(error.localizedDescription)")
            }
        }
    }

    private func checkForAppUpdate() {
         let userDefaults = UserDefaults.standard
         let shouldShowNotification = userDefaults.bool(forKey: "shouldShowUpdateNotification")
         
         if shouldShowNotification {
             // Mostrar la notificación
             sendUpdateNotification()
             
             // Cambiar la variable a false para que no se muestre más
             userDefaults.set(false, forKey: "shouldShowUpdateNotification")
         }
     }

     private func sendUpdateNotification() {
         let content = UNMutableNotificationContent()
         content.title = "¡Nueva Actualizacion!"
         content.body = "Ahora puedes agregar hasta 3 pines a la pantalla de bloqueo."
         content.sound = .default

         // Configurar el trigger para que la notificación se muestre inmediatamente
         let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)

         // Crear la solicitud de notificación
         let request = UNNotificationRequest(identifier: "appUpdateNotification", content: content, trigger: trigger)

         // Agregar la solicitud al centro de notificaciones
         UNUserNotificationCenter.current().add(request) { error in
             if let error = error {
                 print("Error al programar la notificación: \(error.localizedDescription)")
             } else {
                 print("Notificación programada correctamente")
             }
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
