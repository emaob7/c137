import WidgetKit
import SwiftUI

// Proveedor de datos para el widget
struct Provider: TimelineProvider {
    private let userDefaults = UserDefaults(suiteName: "group.artemis.EarthC137.Calendar")

    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), imageName: "new york")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
          let entry = SimpleEntry(date: Date(), imageName: userDefaults?.string(forKey: "selectedImage") ?? "new york")
          completion(entry)
      }

    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
        var entries: [SimpleEntry] = []
        
        // Obtener la fecha actual
        let currentDate = Date()

        // Crear entradas para cada hora
        for hourOffset in 0..<24 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, imageName: userDefaults?.string(forKey: "selectedImage") ?? "new york")
            entries.append(entry)
        }
        
        // Crear el timeline con las entradas y una política de actualización después de la hora siguiente
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
struct CalendarWEntryView: View {
    var entry: SimpleEntry

    var body: some View {
        if #available(iOSApplicationExtension 17.0, *) {
            ZStack {
                Image(entry.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(-17.0)
                    .scaledToFill() // Asegura que la imagen cubra todo el fondo
                    .ignoresSafeArea() // Ignora las áreas seguras para cubrir completamente el widget
                
                
                switch entry.imageName {
                case "new york":
                    newView(date: entry.date)
                case "fire":
                    CincelView(date: entry.date)
                case "hello":
                    helloView(date: entry.date)
                case "chemistry":
                    BadView(date: entry.date)
                case "11 day":
                    onceView(date: entry.date)
                case "sky":
                    skyView(date: entry.date)
                case "yellow name":
                    CallView(date: entry.date)
                case "1987":
                    barcaView(date: entry.date)
                case "1902":
                    MadridView(date: entry.date)
                case "bad design":
                    designView(date: entry.date)
                case "barrilete cosmico":
                    orangeView(date: entry.date)
                case "garra guarani":
                    AlbiView(date: entry.date)
                default:
                    EmptyView()
                }
            }
            .containerBackground(for: .widget) { Color.black }
            .colorScheme(.dark) // Forzar el modo oscuro
            .widgetAccentable(false)
        } else {
            ZStack {
                Image(entry.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(-17.0)
                    .scaledToFill() // Asegura que la imagen cubra todo el fondo
                    .ignoresSafeArea() // Ignora las áreas seguras para cubrir completamente el widget
                
                
                switch entry.imageName {
                case "new york":
                    newView(date: entry.date)
                case "fire":
                    CincelView(date: entry.date)
                case "hello":
                    helloView(date: entry.date)
                case "chemistry":
                    BadView(date: entry.date)
                case "11 day":
                    onceView(date: entry.date)
                case "sky":
                    skyView(date: entry.date)
                case "yellow name":
                    CallView(date: entry.date)
                case "1987":
                    barcaView(date: entry.date)
                case "1902":
                    MadridView(date: entry.date)
                case "bad design":
                    designView(date: entry.date)
                case "barrilete cosmico":
                    orangeView(date: entry.date)
                case "garra guarani":
                    AlbiView(date: entry.date)
                default:
                    EmptyView()
                }
            }
            
           }
        }
        
    }


@main
struct CalendarW: Widget {
    private let kind: String = "ImageSwitcherWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            CalendarWEntryView(entry: entry)
        }
        .configurationDisplayName("Fecha")
        .description("Cuando lo tengas en tu pantalla, toca y elige el tema que más te guste en la sección Fecha")
        .supportedFamilies([.systemSmall])
    }
}

// Previsualización del widget
struct CalendarW_Previews: PreviewProvider {
    static var previews: some View {
        CalendarWEntryView(entry: SimpleEntry(date: Date(), imageName: "new york"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}


extension Date {

    func day() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd" // 01 Día del mes con dos dígitos
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }
    
    func day4() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE" // Wednesday Nombre completo del día de la semana 
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }
    
    func day2() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE" // WED Nombre abreviado del día de la semana
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }

    func month() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM" // Agosto Nombre completo del mes
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }
    
    func month3() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM" // Dec Nombre abreviado del mes
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }

    func year() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy" // 2009 Año con cuatro dígitos
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }
    func year2() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy" // 2009 Año con cuatro dígitos
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }

    
    // Nueva función para formatear la fecha como "dd.MM.yyyy"
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        dateFormatter.locale = Locale.current // Usa la localización del sistema
        return dateFormatter.string(from: self)
    }
}
