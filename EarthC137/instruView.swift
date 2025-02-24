import SwiftUI

struct InstruView: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isEnglish", store: UserDefaults(suiteName: "group.artemis.EarthC137.isEnglish")) private var isEnglish: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                Text(isEnglish ? "🤔 How to add C137 widgets to your home screen?" : "🤔 Cómo agregar widgets de C137 a la pantalla?")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // Paso 1
                        StepView(
                            stepNumber: 1,
                            title: isEnglish ? "Access edit mode on your home screen" : "Accede al modo edición en tu pantalla de inicio",
                            description: isEnglish ? "Press and hold any empty area on your iPhone's home screen until the icons start to shake." : "Mantén presionada cualquier área vacía de la pantalla de inicio de tu iPhone hasta que los íconos comiencen a temblar.",
                            imageName: "step1",
                            isEnglish: isEnglish // Pasar isEnglish
                        )
                        
                        // Paso 2
                        StepView(
                            stepNumber: 2,
                            title: isEnglish ? "Open the widget gallery" : "Abre la galería de widgets",
                            description: isEnglish ? "Press the '+' button in the top left corner to access the widget gallery." : "Presiona el botón '+' en la esquina superior izquierda para acceder a la galería de widgets.",
                            imageName: "step2",
                            isEnglish: isEnglish // Pasar isEnglish
                        )
                        
                        // Paso 3
                        StepView(
                            stepNumber: 3,
                            title: isEnglish ? "Search for the C137 widget" : "Busca el widget de C137",
                            description: isEnglish ? "Scroll or use the search bar to find the C137 widget." : "Desplázate o utiliza la barra de búsqueda para encontrar el widget de C137.",
                            imageName: "step3",
                            isEnglish: isEnglish // Pasar isEnglish
                        )
                        
                        // Paso 4
                        StepView(
                            stepNumber: 4,
                            title: isEnglish ? "Select the widget style" : "Selecciona el estilo del widget",
                            description: isEnglish ? "Choose the Date or Clock widget." : "Elige el widget de Fecha o Reloj.",
                            imageName: "step4",
                            isEnglish: isEnglish // Pasar isEnglish
                        )
                        
                        // Paso 5
                        StepView(
                            stepNumber: 5,
                            title: isEnglish ? "Add the widget to your home screen" : "Agrega el widget a tu pantalla",
                            description: isEnglish ? "Press the 'Add widget' button and drag it to the desired position on your home screen." : "Presiona el botón 'Agregar widget' y arrástralo a la posición deseada en tu pantalla de inicio.",
                            imageName: "step5",
                            isEnglish: isEnglish // Pasar isEnglish
                        )
                        
                        // Paso 6
                        StepView(
                            stepNumber: 6,
                            title: isEnglish ? "Tap the widget and choose the theme" : "Toca el widget y elige el tema",
                            description: isEnglish ? "Choose the theme that best suits your tastes. It will only show an ad each time you choose a theme to keep the app free." : "Elije el tema que más se adecue a tus gustos. Solo mostrará un anuncio cada vez que elijas un tema para mantener la app gratuita.",
                            imageName: "step6",
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

struct StepView: View {
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
