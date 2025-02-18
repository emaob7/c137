import WidgetKit
import SwiftUI

// Proveedor de datos para el widget
struct Provider: TimelineProvider {
    private let userDefaults = UserDefaults(suiteName: "group.artemis.EarthC137.widget1")

    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), imageName: "command one")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
          let entry = SimpleEntry(date: Date(), imageName: userDefaults?.string(forKey: "selectedImage") ?? "command one")
          completion(entry)
      }

    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
            var entries: [SimpleEntry] = []
            
            // Crea entradas para cada minuto
            let currentDate = Date()
            for minuteOffset in 0..<60 {
                let entryDate = Calendar.current.date(byAdding: .minute, value: minuteOffset, to: currentDate)!
                let entry = SimpleEntry(date: entryDate, imageName: userDefaults?.string(forKey: "selectedImage") ?? "command one")
                entries.append(entry)
            }
            
            // Crea el timeline con las entradas y una política de actualización cada minuto
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
struct widget1EntryView: View {
    var entry: SimpleEntry

    var body: some View {
        if #available(iOSApplicationExtension 17.0, *) {
            ZStack {
                Image(entry.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(-17.0)
                    .scaledToFill() // Asegura que la imagen cubra todo el fondo
                    .ignoresSafeArea()
                
                switch entry.imageName {
                case "command one":
                    Text(entry.date, style: .time)
                        .font(Font.custom("Micro5-Regular", size: 40))
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .padding(.top, -44)
                        .padding(.leading,6)
                        .shadow(radius: 10) // Evita el tinte
                    
                case "hi hi":
                    HiHiView(date: entry.date)
                case "11 time":
                    StrangView(date: entry.date)
                case "hello world":
                    CodeView(date: entry.date)
                case "tune":
                    TuneView(date: entry.date)
                case "every second":
                    EveryView(date: entry.date)
                case "the cromas":
                    CromasView(date: entry.date)
                case "wanted":
                    WantedView(date: entry.date)
                case "cloud emoji":
                    CieloView(date: entry.date)
                case "eng james webb Nasa":
                    JamesView(date: entry.date)
                case "earthrise":
                    AstroView(date: entry.date)
                case "call me":
                    CallmeView(date: entry.date)
                case "nostalgia":
                    windowsView(date: entry.date)
                case "art":
                    vanView(date: entry.date)
                case "f**ing":
                    FuckView(date: entry.date)
                case "bff":
                    bffView(date: entry.date)
                case "girasoles para marce🌻":
                    MarceView(date: entry.date)
                case "brat":
                    bratView(date: entry.date)
                case "cartoon console":
                    cartoonView(date: entry.date)
                    
                default:
                    EmptyView()
                }
                     // También aplicar en el fondo del contenedor
                 
            }
            .containerBackground(for: .widget) { Color.clear }
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
                case "command one":
                    Text(entry.date, style: .time)
                        .font(Font.custom("Micro5-Regular", size: 40))
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .padding(.top, -44)
                        .padding(.leading,6)
                        .shadow(radius: 10)
                    
                case "hi hi":
                    HiHiView(date: entry.date)
                case "11 time":
                    StrangView(date: entry.date)
                case "hello world":
                    CodeView(date: entry.date)
                case "tune":
                    TuneView(date: entry.date)
                case "every second":
                    EveryView(date: entry.date)
                case "the cromas":
                    CromasView(date: entry.date)
                case "wanted":
                    WantedView(date: entry.date)
                case "cloud emoji":
                    CieloView(date: entry.date)
                case "eng james webb Nasa":
                    JamesView(date: entry.date)
                case "earthrise":
                    AstroView(date: entry.date)
                case "call me":
                    CallmeView(date: entry.date)
                case "nostalgia":
                    windowsView(date: entry.date)
                case "art":
                    vanView(date: entry.date)
                case "f**ing":
                    FuckView(date: entry.date)
                case "bff":
                    bffView(date: entry.date)
                case "girasoles para marce🌻":
                    MarceView(date: entry.date)
                case "brat":
                    bratView(date: entry.date)
                case "cartoon console":
                    cartoonView(date: entry.date)
                    
                default:
                    EmptyView()
                }
            }
           }
           
        }
        
    }


@main
struct ImageSwitcherWidget: Widget {
    private let kind: String = "ImageSwitcherWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            widget1EntryView(entry: entry)
        }
        .configurationDisplayName("Reloj")
        .description("Cuando lo tengas en tu pantalla, toca y elige el tema que más te guste en la sección Reloj")
        .supportedFamilies([.systemSmall])
    }
}

// Previsualización del widget

struct ImageSwitcherWidget_Previews: PreviewProvider {
    static var previews: some View {
        widget1EntryView(entry: SimpleEntry(date: Date(), imageName: "command one"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}


extension Date {
    func hour() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h" // Formato de 12 horas sin el 0 inicial
        dateFormatter.locale = Locale.current // Usa la localización del sistema
        return dateFormatter.string(from: self)
    }
    func hour2() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh" // Formato de 12 horas sin el 0 inicial
        dateFormatter.locale = Locale.current // Usa la localización del sistema
        return dateFormatter.string(from: self)
    }
    
    func minute() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm"
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }
    
    func amPm() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "a"
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }

    func day() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd" // Día del mes con dos dígitos
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }
    
    func day4() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE" // Nombre completo del día de la semana
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }
    
    func day2() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE" // Nombre abreviado del día de la semana
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }

    func month() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM" // Nombre completo del mes
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }
    
    func month3() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM" // Nombre abreviado del mes
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }

    func year() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy" // Año con cuatro dígitos
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
