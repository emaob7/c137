//
//  SettingsView 2.swift
//  C137
//
//  Created by Emmanuel Ortigoza Bordón on 2024-10-17.
//


import SwiftUI
import MessageUI

struct SettingsView: View {
    @State private var showingTermsOfService = false
    @State private var showingPrivacyPolicy = false
    @State private var showingMailComposer = false
    @State private var showingAtribution = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Sección de encabezado "Contacto"
            Text("Contacto")
                .font(.title)
                .bold()
                .padding(.bottom, 10)
            
            HStack {
                Image(systemName: "envelope.fill")
                    .foregroundColor(.gray) // Icono para contacto
                Button("Escríbenos") {
                    sendEmail()
                }
                Spacer() // Alinea el botón a la izquierda
            }
            .padding(.bottom, 10)
            
            // Botón para Instagram
            HStack {
                Image(systemName: "camera.fill")
                    .foregroundColor(.gray) // Icono para Instagram
                Button("Instagram") {
                    openInstagram()
                }
                Spacer()
            }
            .padding(.bottom, 10)
            
            // Botón para TikTok
            HStack {
                Image(systemName: "music.note")
                    .foregroundColor(.gray) // Icono para TikTok
                Button("TikTok") {
                    openTikTok()
                }
                Spacer()
            }
            .padding(.bottom, 10)
            
            // Sección de encabezado "Términos y Privacidad"
            Text("Términos y Privacidad")
                .font(.title)
                .bold()
                .padding(.top, 20)
                .padding(.bottom, 10)
            
            HStack {
                Image(systemName: "doc.text")
                    .foregroundColor(.gray) // Icono para Términos
                Button("Términos de Servicio") {
                    showingTermsOfService = true
                }
                .sheet(isPresented: $showingTermsOfService) {
                    TermsOfServiceView()
                }
                Spacer()
            }
            .padding(.bottom, 10)
            
            HStack {
                Image(systemName: "lock.fill")
                    .foregroundColor(.gray) // Icono para Privacidad
                Button("Declaración de Privacidad") {
                    showingPrivacyPolicy = true
                }
                .sheet(isPresented: $showingPrivacyPolicy) {
                    PrivacyPolicyView()
                }
                Spacer()
            }
            .padding(.bottom, 10)
            
            HStack {
                Image(systemName: "doc.text")
                    .foregroundColor(.gray) // Icono para Atribuciones
                Button("Atribuciones") {
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
        .navigationBarTitle("Configuración", displayMode: .inline)
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
        let tiktokUsername = "emaob7_"
        let appURL = URL(string: "snssdk1128://user/profile/\(tiktokUsername)")!
        let webURL = URL(string: "https://www.tiktok.com/@\(tiktokUsername)")!
        
        if UIApplication.shared.canOpenURL(appURL) {
            UIApplication.shared.open(appURL)
        } else {
            UIApplication.shared.open(webURL)
        }
    }
    
    private func sendEmail() {
        guard let emailURL = createEmailUrl(to: "c137cardpy@gmail.com", subject: "Consulta", body: "Escribe aquí...") else { return }
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

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
