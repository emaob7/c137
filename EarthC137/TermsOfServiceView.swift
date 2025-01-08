//
//  TermsOfServiceView.swift
//  C137
//
//  Created by Emmanuel Ortigoza Bordón on 2024-09-26.
//

import Foundation
import SwiftUI

struct TermsOfServiceView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            Text("Términos de Servicio")
                .font(.largeTitle)
                .bold()
                .padding()

            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Group {
                        Text("1. Aceptación de los Términos")
                            .font(.headline)
                        
                        Text("Al descargar y usar nuestra aplicación, aceptas cumplir con estos Términos de Servicio. Si no estás de acuerdo con estos términos, te recomendamos no usar la aplicación.")
                        
                        Text("2. Uso de la Aplicación")
                            .font(.headline)
                        
                        Text("La aplicación es gratuita y permite a los usuarios seleccionar temas para widgets en la pantalla principal y fondo de pantalla. Nos reservamos el derecho de modificar, suspender o discontinuar cualquier parte de la aplicación en cualquier momento sin previo aviso.")
                        
                        Text("3. Anuncios")
                            .font(.headline)
                        
                        Text("Para mantener la aplicación gratuita, se muestran anuncios cada vez que se selecciona un tema en el widget. Estos anuncios son proporcionados por terceros. No somos responsables del contenido de estos anuncios ni de las acciones que puedan llevar a cabo.")
                        
                        Text("4. Propiedad Intelectual")
                            .font(.headline)
                        
                        Text("Todos los derechos, títulos e intereses relacionados con la aplicación, incluidos, entre otros, los textos, gráficos, imágenes, y software, son propiedad de C137 o sus licenciantes. No puedes reproducir, distribuir o modificar ningún contenido sin nuestro consentimiento previo por escrito.")
                    }
                    
                    Group {
                        Text("5. Limitación de Responsabilidad")
                            .font(.headline)
                        
                        Text("No seremos responsables por daños directos, indirectos, incidentales o consecuentes que resulten del uso o la incapacidad de uso de la aplicación. La aplicación se proporciona \"tal cual\", sin garantía de ningún tipo.")
                        
                        Text("6. Cambios a los Términos de Servicio")
                            .font(.headline)
                        
                        Text("Nos reservamos el derecho de modificar estos Términos de Servicio en cualquier momento. Cualquier cambio será efectivo inmediatamente después de su publicación en esta página.")
                    }
                }
                .padding()
            }
            
            Button("Cerrar") {
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
        }
        .navigationTitle("Términos de Servicio")
    }
}
