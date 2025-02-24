import SwiftUI
import MessageUI

struct SettingsView: View {
    @State private var showingTermsOfService = false
    @State private var showingPrivacyPolicy = false
    @State private var showingMailComposer = false
    @State private var showingAtribution = false
    @State private var showLanguageAlert = false
    @AppStorage("isEnglish", store: UserDefaults(suiteName: "group.artemis.EarthC137.isEnglish")) private var isEnglish: Bool = false
    

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Logo y Título
            HStack {
                Spacer()
                Image("c137trades")
                    .resizable()
                    .frame(width: 60, height: 60)
                Text("C137")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            .padding(.bottom, 10)
            
            // Descripción de la app
            Text(isEnglish ? "The coolest, most aesthetic and parodic clock and date widgets in this universe." : "Los widgets de reloj y fecha más cools, paródicos & aesthetics de este universo.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
            // Sección de idioma
                    Text(isEnglish ? "Language" : "Idioma")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 10)
                    
                    HStack {
                        
                        
                        // Botón de toggle para cambiar el idioma
                        Button(action: {
                            showLanguageAlert = true // Mostrar el Alert
                        }) {
                            Text(isEnglish ? "🌐 Español?" : "🌐 English?")
                                .font(.body)
                                .padding(10)
                                .foregroundColor(.blue)
                                .cornerRadius(20)
                        }
                        .alert(isPresented: $showLanguageAlert) { // Modificador para mostrar el Alert
                            Alert(
                                title: Text(isEnglish ? "¿Cambiar idioma?" : "Change language?"),
                                message: Text(isEnglish ? "¿Quieres cambiar a Español 🇪🇸?" : "Do you want to switch to English 🇺🇸?"),
                                primaryButton: .default(Text(isEnglish ? "Si" : "Yes")) {
                                    isEnglish.toggle() // Cambiar el idioma
                                },
                                secondaryButton: .destructive(Text("No")) // No hacer nada
                            )
                        }
                        
                    }
                    .padding(.bottom, 20)
                    
            // Sección de encabezado "Contacto"
            Text(isEnglish ? "Contact" : "Contacto")
                .font(.title2)
                .bold()
                .padding(.bottom, 10)
            
            HStack {
                Text("✉️")
                Button(isEnglish ? "Write to us" : "Escríbenos") {
                    sendEmail()
                }
                Spacer()
            }
            .padding(.bottom, 10)
            
            // Botón para Instagram
            HStack {
                Text("📷")
                Button("Instagram") {
                    openInstagram()
                }
                Spacer()
            }
            .padding(.bottom, 10)
            
            // Botón para TikTok
            HStack {
                Text("🎬")
                Button("TikTok") {
                    openTikTok()
                }
                Spacer()
            }
            .padding(.bottom, 10)
            
            // Sección de encabezado "Términos y Privacidad"
            Text(isEnglish ? "Terms and Privacy" : "Términos y Privacidad")
                .font(.title2)
                .bold()
                .padding(.top, 20)
                .padding(.bottom, 10)
            
            HStack {
                Text("📄")
                Button(isEnglish ? "Terms of Service" : "Términos de Servicio") {
                    showingTermsOfService = true
                }
                .sheet(isPresented: $showingTermsOfService) {
                    TermsOfServiceView()
                }
                Spacer()
            }
            .padding(.bottom, 10)
            
            HStack {
                Text("🔒")
                Button(isEnglish ? "Privacy Policy" : "Declaración de Privacidad") {
                    showingPrivacyPolicy = true
                }
                .sheet(isPresented: $showingPrivacyPolicy) {
                    PrivacyPolicyView()
                }
                Spacer()
            }
            .padding(.bottom, 10)
            
            HStack {
                Text("🏅")
                Button(isEnglish ? "Attributions" : "Atribuciones") {
                    showingAtribution = true
                }
                .sheet(isPresented: $showingAtribution) {
                    AtributionsView()
                }
                Spacer()
            }
            .padding(.bottom, 10)
        }
        .padding(.horizontal)
      //  .navigationTitle(isEnglish ? "Settings" : "Configuración", displayMode: .inline)
    }
    
    // Función para abrir Instagram
    private func openInstagram() {
        let instagramUsername = "c137.w"
        let appURL = URL(string: "instagram://user?username=\(instagramUsername)")!
        let webURL = URL(string: "https://instagram.com/\(instagramUsername)")!
        
        if UIApplication.shared.canOpenURL(appURL) {
            UIApplication.shared.open(appURL)
        } else {
            UIApplication.shared.open(webURL)
        }
    }
    
    // Función para abrir TikTok
    private func openTikTok() {
        let tiktokUsername = "c137.tt"
        let appURL = URL(string: "snssdk1128://user/profile/\(tiktokUsername)")!
        let webURL = URL(string: "https://www.tiktok.com/@\(tiktokUsername)")!
        
        if UIApplication.shared.canOpenURL(appURL) {
            UIApplication.shared.open(appURL)
        } else {
            UIApplication.shared.open(webURL)
        }
    }
    
    private func sendEmail() {
        guard let emailURL = createEmailUrl(to: "c137cardpy@gmail.com", subject: isEnglish ? "Inquiry" : "Consulta", body: isEnglish ? "Write here..." : "Escribe aquí...") else { return }
        if UIApplication.shared.canOpenURL(emailURL) {
            UIApplication.shared.open(emailURL)
        }
    }

    private func createEmailUrl(to: String, subject: String, body: String) -> URL? {
        let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let bodyEncoded = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let gmailUrl = URL(string: "googlegmail://co?to=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
        let outlookUrl = URL(string: "ms-outlook://compose?to=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
        let yahooUrl = URL(string: "ymail://mail/compose?to=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
        let defaultUrl = URL(string: "mailto:\(to)?subject=\(subjectEncoded)&body=\(bodyEncoded)")

        if let gmailUrl = gmailUrl, UIApplication.shared.canOpenURL(gmailUrl) {
            return gmailUrl
        } else if let outlookUrl = outlookUrl, UIApplication.shared.canOpenURL(outlookUrl) {
            return outlookUrl
        } else if let yahooUrl = yahooUrl, UIApplication.shared.canOpenURL(yahooUrl) {
            return yahooUrl
        }

        return defaultUrl
    }
}
