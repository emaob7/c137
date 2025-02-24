import SwiftUI

struct ConfirmationMessageView: View {
    @Binding var isEnglish: Bool

    var body: some View {
        ZStack {
            // Fondo negro con esquinas redondeadas
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.black.opacity(0.9)) // Fondo negro con opacidad
                .shadow(radius: 15) // Sombra para un efecto elevado
                .frame(width: 120, height: 50) // Tamaño del fondo

            // Contenido de la vista
            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
                    .font(.system(size: 20)) // Tamaño del ícono
                Text(isEnglish ? "Done!" : "¡Listo!")
                    .font(.system(size: 16, weight: .bold)) // Estilo del texto
                    .foregroundColor(.white) // Texto en blanco
            }
        }
        .transition(.opacity) // Animación de aparición
        .padding(.top, 20) // Espacio superior
    }
}
