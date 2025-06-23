import WidgetKit
import SwiftUI

// Proveedor de datos para el widget
struct Provider: TimelineProvider {
    private let userDefaults = UserDefaults(suiteName: "group.artemis.EarthC137.Lock2")

    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), imageName: "love")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let imageName = userDefaults?.string(forKey: "selectedImage") ?? "love"
        print("getSnapshot imageName: \(imageName)")  // Añade un print para ver qué valor se está leyendo
        let entry = SimpleEntry(date: Date(), imageName: imageName)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
        var entries: [SimpleEntry] = []
        let currentDate = Date()
        for minuteOffset in 0..<60 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: minuteOffset, to: currentDate)!
            let imageName = userDefaults?.string(forKey: "selectedImage") ?? "love"
            //print("getTimeline imageName: \(imageName)")  // Añade un print aquí también
            let entry = SimpleEntry(date: entryDate, imageName: imageName)
            entries.append(entry)
        }
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }

    }

// Estructura de la entrada del timeline
struct SimpleEntry: TimelineEntry {
    let date: Date
    let imageName: String

}

// Vista que mostrará la imagen en el widget
struct lock1EntryView: View {
    var entry: SimpleEntry
    var deepLinkURL: URL {
            URL(string: "EarthC137://tab/pins")! // Para la pestaña de Pins (tercera)
        }


    var body: some View {
        if #available(iOSApplicationExtension 17.0, *) {
            Link(destination: deepLinkURL) {
                ZStack {
                    Image(entry.imageName)
                        .resizable()
                        .padding(-10.0)
                        .scaledToFill() // Asegura que la imagen cubra todo el fondo
                        .ignoresSafeArea() // Ignora las áreas seguras para cubrir completamente el widget
                }
                .containerBackground(for: .widget) { Color.clear }
                
            }
            
            } else {
                VStack {
                    Text("Actualiza tu dispositivo")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Text("Este widget requiere iOS 17 o superior para mostrar todo su potencial.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                .background(Color.black.opacity(0.1))
                .cornerRadius(10)
                .padding()
            }
        }
    }
    


@main
struct lock2Widget: Widget {
    private let kind: String = "ImageSwitcherWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            lock1EntryView(entry: entry)
        }
        .configurationDisplayName("Pin 2")
        .description("Toca y elige el tema que más te guste en la sección Pins")
        .supportedFamilies([.accessoryCircular])
    }
}

// Previsualización del widget
/*
struct lock1_Previews: PreviewProvider {
    static var previews: some View {
        lock1EntryView(entry: SimpleEntry(date: Date(), imageName: "dont touch"))
            .previewContext(WidgetPreviewContext(family: .accessoryCircular))
    }
}

*/
