import SwiftUI

struct PersistenceView: View {
    var date: Date
    var image: String
    
    var body: some View {
        ZStack {
            // Fondo o elementos base si los necesitas
            Image(image) // Usa la imagen que coincide con la hora ajustada
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(-17.0)
                .scaledToFill() // Asegura que la imagen cubra todo el fondo
                .ignoresSafeArea()
            VStack {
                HStack(spacing: 29) {
                    Text(date.day())
                    Text(date.month3())
                    Text(date.year())
                }
                .font(Font.custom("DSEG7ModernMini-Bold", size: 11))
                .kerning(-1)
                .fontWeight(.bold)
                .foregroundColor(.black)
                
                Spacer() // Empuja el contenido hacia arriba
            }
            .padding(.top, 10) // Ajuste fino para la posición
            
            // Capa para la hora (centro)
            Text(date, style: .time)
                .font(Font.custom("DSEG7ModernMini-Bold", size: 25))
                .foregroundColor(.black)
                .kerning(-2)
                .offset(y: 2) // Ajuste vertical fino
            
            // Capa para los textos inferiores
            VStack {
                Spacer() // Empuja el contenido hacia abajo
                
                HStack {
                    VStack(spacing: 11) {
                        Text(date.day2()) // "es", "en", etc.
                        Text(Locale.current.language.languageCode?.identifier ?? "es") // "es", "en", etc.
                    }
                    .offset(x: -50) // Ajuste vertical fino
                }
                .font(Font.custom("DSEG7ModernMini-Bold", size: 11))
                .foregroundColor(.black)
                .padding(.bottom, 9) // Ajuste fino para la posición inferior
            }
            VStack {
                Spacer() // Empuja el contenido hacia abajo
                
                HStack {
                    VStack {
                        Text(TimeZone.current.identifier) // "America/Mexico_City"
                    }
                   // .offset(x: -50) // Ajuste vertical fino
                }
                .font(Font.custom("Audiowide-Regular", size: 6))
                .foregroundColor(.black)
                .offset(y: -3)
                .offset(x: 25)
               
            }
            VStack {
                Spacer() // Empuja el contenido hacia abajo
                
                HStack {
                    VStack {
                        Text("Compiled for iOS \(Bundle.main.infoDictionary?["DTPlatformVersion"] as? String ?? "17")")
                    }
                   // .offset(x: -50) // Ajuste vertical fino
                }
                .font(Font.custom("Audiowide-Regular", size: 6))
                .foregroundColor(.white)
                .offset(y: 9)
               
            }
             // Ajuste fino para la posición inferior
            
            
        }
        .frame(maxWidth: 400, maxHeight: 400)
        
    }
}
