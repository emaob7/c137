//
//  instruView.swift
//  C137
//
//  Created by Emmanuel Ortigoza Bordón on 2024-11-19.
//

import SwiftUI

struct InstruView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                Text("🤔 Cómo agregar widgets de C137 a la pantalla?")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // Paso 1
                        StepView(
                            stepNumber: 1,
                            title: "Accede al modo edición en tu pantalla de inicio",
                            description: "Mantén presionada cualquier área vacía de la pantalla de inicio de tu iPhone hasta que los íconos comiencen a temblar.",
                            imageName: "step1"
                        )
                        
                        // Paso 2
                        StepView(
                            stepNumber: 2,
                            title: "Abre la galería de widgets",
                            description: "Presiona el botón '+' en la esquina superior izquierda para acceder a la galería de widgets.",
                            imageName: "step2"
                        )
                        
                        // Paso 3
                        StepView(
                            stepNumber: 3,
                            title: "Busca el widget de C137",
                            description: "Desplázate o utiliza la barra de búsqueda para encontrar el widget de C137.",
                            imageName: "step3"
                        )
                        
                        // Paso 4
                        StepView(
                            stepNumber: 4,
                            title: "Selecciona el estilo del widget",
                            description: "Elige el widget de Fecha o Reloj.",
                            imageName: "step4"
                        )
                        
                        // Paso 5
                        StepView(
                            stepNumber: 5,
                            title: "Agrega el widget a tu pantalla",
                            description: "Presiona el botón 'Agregar widget' y arrástralo a la posición deseada en tu pantalla de inicio.",
                            imageName: "step5"
                        )
                        
                        // Paso 6
                        StepView(
                            stepNumber: 6,
                            title: "Toca el widget y elige el tema",
                            description: "Elije el tema que mas se adecue a tus gustos, solo mostrara un anuncio cada vez que elijas un tema para mantener la app gratuita",
                            imageName: "step6"
                        )
                    }
                    .padding()
                }
                
                Button("Cerrar") {
                    presentationMode.wrappedValue.dismiss()
                }
                .padding()
            }
            .navigationTitle("💡Instrucciones")
        }
    }
}

struct StepView: View {
    let stepNumber: Int
    let title: String
    let description: String
    let imageName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Paso \(stepNumber)")
                .font(.headline)
            
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
            
            Text(description)
                .font(.body)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 500) // Ajusta el tamaño de la imagen según sea necesario
                .cornerRadius(10)
                .shadow(radius: 5)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}


