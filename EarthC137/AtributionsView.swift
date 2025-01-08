//
//  Atributions.swift
//  C137
//



import Foundation
import SwiftUI

struct AtributionsView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            Text("Atribuciones")
                .font(.largeTitle)
                .bold()
                .padding()

            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Group {
                        Text("1. NASA's James Webb Space Telescope")
                            .font(.headline)
                        
                        Text("Las imágenes del Telescopio Espacial James Webb (JWST) son cortesía de NASA, ESA, CSA, y STScI. Para más información, visita:")
                        
                        Link("https://webb.nasa.gov/", destination: URL(string: "https://webb.nasa.gov/")!)
                        
                        Text("2. La gran ola de Kanagawa")
                            .font(.headline)
                        
                        Text("De Según Katsushika Hokusai - Restored version of File:Great Wave off Kanagawa.jpg (rotated and cropped, dirt, stains, and smudges removed. Creases corrected. Histogram adjusted and color balanced.), Dominio público.")
                        
                        Link("https://commons.wikimedia.org/w/index.php?curid=5576388", destination: URL(string: "https://commons.wikimedia.org/w/index.php?curid=5576388")!)
                        
                        Text("3. Screenshoots para la Appstore")
                            .font(.headline)
                        Text("Gracias a https://previewed.app")
            
                        Link("https://previewed.app/template/2A772EE0", destination: URL(string: "https://previewed.app/template/2A772EE0")!)
                    }
                }
                .padding()

            }
            
            Button("Cerrar") {
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
        }
        .navigationTitle("Atribuciones")
    }
}
