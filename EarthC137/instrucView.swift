import SwiftUICore
import SwiftUI

struct instrucView: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isEnglish", store: UserDefaults(suiteName: "group.artemis.EarthC137.isEnglish")) private var isEnglish: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                Text(isEnglish ? "🤔 How to add C137 widgets to your lock screen?" : "🤔 Cómo agregar widgets de C137 en la pantalla de bloqueo?")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // Paso 1
                        SteplView(
                            stepNumber: 1,
                            title: isEnglish ? "Access your lock screen customization mode" : "Accede al modo de personalización de tu pantalla de bloqueo",
                            description: isEnglish ? "Press and hold your iPhone's lock screen until the customization option appears." : "Mantén presionada la pantalla de bloqueo de tu iPhone hasta que aparezca la opción de personalización.",
                            imageName: "l1",
                            isEnglish: isEnglish // Pasar isEnglish
                        )
                        
                        // Paso 2
                        SteplView(
                            stepNumber: 2,
                            title: isEnglish ? "Press 'Customize'" : "Presiona 'Personalizar'",
                            description: isEnglish ? "Select 'Customize' below your active lock screen or create a new lock screen by tapping the '+' icon." : "Selecciona 'Personalizar' debajo de tu pantalla de bloqueo activa o crea una nueva pantalla de bloqueo tocando el ícono '+'.",
                            imageName: "l2",
                            isEnglish: isEnglish // Pasar isEnglish
                        )
                        
                        // Paso 3
                        SteplView(
                            stepNumber: 3,
                            title: isEnglish ? "Open the widget editor" : "Abre el editor de widgets",
                            description: isEnglish ? "Press the area below the clock where the widgets will appear." : "Presiona el área debajo del reloj donde aparecerán los widgets.",
                            imageName: "l3",
                            isEnglish: isEnglish // Pasar isEnglish
                        )
                        
                        // Paso 4
                        SteplView(
                            stepNumber: 4,
                            title: isEnglish ? "Search and select the C137 widget" : "Busca y selecciona el widget de C137",
                            description: isEnglish ? "Scroll through the list or use the search bar to find and select the C137 widget." : "Desplázate por la lista o usa la barra de búsqueda para encontrar y seleccionar el widget de C137.",
                            imageName: "l4",
                            isEnglish: isEnglish // Pasar isEnglish
                        )
                        
                        // Paso 5
                        SteplView(
                            stepNumber: 5,
                            title: isEnglish ? "Choose the widget type" : "Elige el tipo de widget",
                            description: isEnglish ? "Select the Pin #1 widget." : "Selecciona el widget Pin #1.",
                            imageName: "l5",
                            isEnglish: isEnglish // Pasar isEnglish
                        )
                        
                        // Paso 6
                        SteplView(
                            stepNumber: 6,
                            title: isEnglish ? "Adjust and save changes" : "Ajusta y guarda los cambios",
                            description: isEnglish ? "Drag the widget to the desired position below the clock and press 'Done' to save your settings." : "Arrastra el widget al lugar deseado debajo del reloj y presiona 'Listo' para guardar tu configuración.",
                            imageName: "l6",
                            isEnglish: isEnglish // Pasar isEnglish
                        )
                        
                        // Paso 7
                        SteplView(
                            stepNumber: 7,
                            title: isEnglish ? "Customize themes" : "Personaliza los temas",
                            description: isEnglish ? "Choose a theme or style. Changes will take effect after an ad to keep the app free." : "Elige un tema o estilo. Los cambios se activarán después de un anuncio para mantener la app gratuita.",
                            imageName: "l7",
                            isEnglish: isEnglish // Pasar isEnglish
                        )
                    }
                    .padding()
                }
                
                Button(isEnglish ? "Close" : "Cerrar") {
                    presentationMode.wrappedValue.dismiss()
                }
                .padding()
            }
            .navigationTitle(isEnglish ? "💡Instructions" : "💡Instrucciones")
        }
    }
}

// Estructura para cada paso
struct SteplView: View {
    let stepNumber: Int
    let title: String
    let description: String
    let imageName: String
    let isEnglish: Bool // Nuevo parámetro
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(isEnglish ? "Step \(stepNumber)" : "Paso \(stepNumber)")
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

// Previews
struct instrucView_Previews: PreviewProvider {
    static var previews: some View {
        instrucView()
    }
}
