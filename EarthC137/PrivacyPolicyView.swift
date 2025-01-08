//
//  PrivacyPolicyView.swift
//  C137
//
//  Created by Emmanuel Ortigoza Bordón on 2024-09-26.
//

import Foundation
import SwiftUI

struct PrivacyPolicyView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Declaración de Privacidad")
                .font(.largeTitle)
                .bold()
                .padding()

            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Group {
                        Text("1. Información Recopilada")
                            .font(.headline)
                        
                        Text("Nuestra aplicación no recopila datos personales identificables. No solicitamos ni almacenamos información como nombres, direcciones de correo electrónico, números de teléfono o cualquier otra información que pueda identificar a los usuarios.")
                        
                        Text("2. Uso de Información")
                            .font(.headline)
                        
                        Text("Como no recopilamos información personal, no usamos, compartimos ni vendemos datos personales a terceros.")
                        
                        Text("3. Anuncios")
                            .font(.headline)
                        
                        Text("Para mantener la aplicación gratuita, utilizamos servicios de terceros para mostrar anuncios. Estos terceros pueden utilizar cookies u otras tecnologías para ofrecerte anuncios personalizados. No tenemos control sobre estos procesos y te recomendamos revisar las políticas de privacidad de los proveedores de anuncios para obtener más información.")
                        
                        Text("4. Seguridad")
                            .font(.headline)
                        
                        Text("Aunque no recopilamos datos personales, nos esforzamos por implementar medidas de seguridad para proteger la integridad de la aplicación y prevenir el acceso no autorizado o la alteración de cualquier contenido de la aplicación.")
                    }
                    
                    Group {
                        Text("5. Cambios a la Declaración de Privacidad")
                            .font(.headline)
                        
                        Text("Nos reservamos el derecho de actualizar esta Declaración de Privacidad en cualquier momento. Los cambios serán efectivos inmediatamente después de su publicación en esta página.")
                        
                        Text("6. Contacto")
                            .font(.headline)
                        
                        Text("Si tienes alguna pregunta o inquietud sobre esta Declaración de Privacidad, por favor contacta con nosotros a través de c137cardpy@gmail.com")
                    }
                }
                .padding()
            }
            
            Button("Cerrar") {
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
        }
        .navigationTitle("Declaración de Privacidad")
    }
}
