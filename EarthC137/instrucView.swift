//
//  instruLockScreenView.swift
//  C137
//
//  Created by Emmanuel Ortigoza Bordón on 2024-11-19.
//

import SwiftUI

struct instrucView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                Text("Cómo agregar widgets de C137 en la pantalla de bloqueo")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // Paso 1
                        SteplView(
                            stepNumber: 1,
                            title: "Accede al modo de personalización de tu pantalla de bloqueo",
                            description: "Mantén presionada la pantalla de bloqueo de tu iPhone hasta que aparezca la opción de personalización.",
                            imageName: "l1"
                        )
                        
                        // Paso 2
                        SteplView(
                            stepNumber: 2,
                            title: "Presiona 'Personalizar'",
                            description: "Selecciona 'Personalizar' debajo de tu pantalla de bloqueo activa o crea una nueva pantalla de bloqueo tocando el ícono '+'.",
                            imageName: "l2"
                        )
                        
                        // Paso 3
                        SteplView(
                            stepNumber: 3,
                            title: "Abre el editor de widgets",
                            description: "Presiona el área debajo del reloj donde aparecerán los widgets.",
                            imageName: "l3"
                        )
                        
                        // Paso 4
                        SteplView(
                            stepNumber: 4,
                            title: "Busca y selecciona el widget de C137",
                            description: "Desplázate por la lista o usa la barra de búsqueda para encontrar y seleccionar el widget de C137.",
                            imageName: "l4"
                        )
                        
                        // Paso 5
                        SteplView(
                            stepNumber: 5,
                            title: "Elige el tipo de widget",
                            description: "Selecciona el widget Pin #1",
                            imageName: "l5"
                        )
                        
                        // Paso 6
                        SteplView(
                            stepNumber: 6,
                            title: "Ajusta y guarda los cambios",
                            description: "Arrastra el widget al lugar deseado debajo del reloj y presiona 'Listo' para guardar tu configuración.",
                            imageName: "l6"
                        )
                        
                        // Paso 7
                        SteplView(
                            stepNumber: 7,
                            title: "Personaliza los temas",
                            description: "Elege un tema o estilo. Los cambios se activarán después de un anuncio para mantener la app gratuita.",
                            imageName: "l7"
                        )
                    }
                    .padding()
                }
                
                Button("Cerrar") {
                    presentationMode.wrappedValue.dismiss()
                }
                .padding()
            }
            .navigationTitle("Instrucciones")
        }
    }
}

// Estructura para cada paso
struct SteplView: View {
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

// Integración en otra vista


// Previews
struct instrucView_Previews: PreviewProvider {
    static var previews: some View {
        instrucView()
    }
}


