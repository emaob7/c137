

import SwiftUI
import WidgetKit

struct ClockView: View {
    @State private var searchText = ""
    @State private var showAlert = false
    @State private var showDescriptionAlert = false
    @State private var selectedImageName = UserDefaults(suiteName: "group.artemis.EarthC137.widget1")?.string(forKey: "selectedImage") ?? "command one"
    @State private var showInstruModal = false
    @State private var showLanguageAlert = false
    @State private var showConfirmationMessage = false // Estado para el mensaje de confirmació
    @AppStorage("isEnglish", store: UserDefaults(suiteName: "group.artemis.EarthC137.isEnglish"))
    private var isEnglish: Bool = true
    
    private let userDefaults = UserDefaults(suiteName: "group.artemis.EarthC137.widget1")
    private let images = ["persistence","brat","girasoles para marce🌻","f**ing","cartoon console","bff","command one", "earthrise","art", "wanted", "eng james webb Nasa","every second","11 time", "cloud emoji", "hi hi", "hello world","call me","nostalgia", "tune"]
    private let imageDescriptions: [String: String] = [ // Descripciones para las imágenes
           "girasoles para marce🌻": "En un universo lleno de posibilidades infinitas, ocurre una coincidencia que lo cambia todo: una conexión tan única que desafía al tiempo y la distancia.(Girasoles para Marce) no es solo un widget; es un recordatorio de que en este vasto universo, siempre llega alguien que ilumina nuestro camino y nos hace sentir que no estamos solos, alguien que queremos abrazar y no soltar nunca.Dedícalo a esa persona que da sentido a tus días con apenas un mensaje y nunca olvides que la verdadera magia de la vida está en las conexiones unicas y genuinas que tocan el alma.Porque todos necesitamos un Marce en nuestra vida.🌻",
           "f**ing": "En medio del caos, soledad y búsqueda de significado, hay una Serie de TV que nos recuerda que incluso en medio del desorden, encontrar a alguien que te entienda puede cambiarlo todo. Este widget captura la esencia de esa conexión única, donde dos almas imperfectas se encuentran y descubren que el verdadero viaje no es escapar del mundo, sino enfrentar juntos lo desconocido.",
           "bff": "La vida puede ser un torbellino de altibajos, pero Friends nos enseña que, con las personas adecuadas a tu lado, cada día es más llevadero. Este widget celebra esas amistades que se convierten en familia, los momentos de risa compartida, los consejos en el sofá y los recuerdos que siempre nos acompañan.",
           "command one":"De niños jugar a la consola era un ritual, una aventura donde cada partida era una nueva historia por vivir. Y todos queríamos el mando 1, no solo por ser el protagonista, sino porque simbolizaba el liderazgo y teniamos la creencia que el mando 1 daba un plus al jugador. 🎮",
           "earthrise":"Desde el vacío infinito del espacio, Earthrise una foto de la Nasa nos muestra nuestro hogar como nunca antes: frágil, hermoso y lleno de posibilidades. Este widget captura ese momento histórico que nos recuerda la grandeza del cosmos y, al mismo tiempo, la pequeña pero significativa existencia de nuestro planeta. Recordandonos que, en medio de la inmensidad, la Tierra es un lugar único que debemos cuidar, un punto azul donde se entrelazan todas nuestras historias. 🌍✨",
           "art":"Este widget es un homenaje a los amantes del arte, un museo en miniatura que vive en tu pantalla. Cada hora, una obra maestra diferente te transporta a un universo de colores, formas y emociones, recordándote que el arte tiene el poder de inspirarnos y llevarnos a algo más grande. Perfecto para quienes ven en cada pincelada una historia y en cada obra un pedazo del alma humana. 🎨✨",
           "wanted":"Al igual que los piratas del sombrero de paja, todos tenemos un tesoro por el que luchar, amigos que se convierten en familia y un viaje que vale la pena vivir. ",
           "eng james webb Nasa":"Eng James Webb NASA es un homenaje visual al esfuerzo humano detrás de uno de los proyectos más ambiciosos de la exploración espacial. Este widget despliega 24 imágenes del proceso de ensamblaje del telescopio James Webb, mostrando la dedicación, precisión y trabajo en equipo que hicieron posible este avance histórico. Más que un tributo, es una invitación a apreciar la complejidad del diseño y a aprender cómo la ciencia y la ingeniería se unen para expandir los límites de nuestro conocimiento del universo. 🌌🔧",
           "every second":"Every Second está inspirado en la intensidad y profundidad de una serie de TV, recordándonos que en la vida, cada segundo importa. Este widget es un tributo a esos momentos que parecen pequeños, pero que en realidad construyen nuestras grandes historias. Perfecto para quienes saben que el tiempo no se mide solo en minutos, sino en pasión, esfuerzo y el deseo de transformar lo cotidiano en algo extraordinario.🥫✨",
           "11 time":"Un viaje entre mundos donde la valentía, la amistad y el poder de enfrentar lo desconocido son clave. Este widget tiene significado de encontrar la fuerza dentro de nosotros para luchar contra la oscuridad. Perfecto para los que creen que incluso en los momentos más oscuros, siempre hay luz al otro lado. ⚡🕰️",
           "cloud emoji":"Cloud Emoji trae consigo la nostalgia de esos momentos mágicos frente a la pantalla, cuando unas nubes esponjosas y un color amarillo vibrante nos daban la bienvenida a un mundo lleno de risas y lecciones de vida. Este widget captura esa esencia que marcó nuestra infancia, recordándonos que a veces, lo más simple puede llenarnos de felicidad y reconectarnos con los recuerdos más cálidos. ☁️✨",
           "hi hi":"Hi Hi está inspirado en la ternura del romance adolescente, recordándonos que un simple hi puede ser el inicio de algo maravilloso: una amistad, una historia de amor o un momento inolvidable. Los puntos entre los números de la hora llevan un hi, como un guiño a esos pequeños gestos que tienen el poder de cambiarlo todo. Perfecto para quienes creen en la magia de los detalles. ❤️⏰",
           "hello world":"Hello World es un tributo a los programadores y su pasión por el código. Diseñado como un editor de texto, este widget evoca esos primeros pasos en el mundo de la programación, donde cada línea de código abre la puerta a infinitas posibilidades. Perfecto para quienes saben que detrás de un simple Hello, World se esconde el inicio de algo extraordinario. 💻✨",
           "call me":"Call Me está inspirado en la intensidad y belleza de una Pelicula, un tributo a las conexiones que marcan nuestra vida para siempre. Este widget captura la esencia de aquellos momentos donde las palabras no bastan, pero un simple llámame puede contener todo lo que sentimos. Perfecto para quienes creen en el amor auténtico, profundo y transformador. 💔✨",
           "nostalgia":"Nostalgia captura la calma de un paisaje verde bajo un cielo azul, transportándonos a una época en la que la tecnología nos invitaba a soñar con un futuro brillante. Inspirado en aquellos fondos icónicos que marcaron una era, este widget es un homenaje a la simplicidad y la belleza de la naturaleza, incluso desde una pantalla. 🌳✨",
           "brat":"Imagina un reloj que no solo marca el tiempo, sino que también provoca, cuestiona y rompe esquemas. Brat es más que un guiño a la rebeldía; es un grito en verde, ese tono “ofensivo” que habla de imperfección y caos, pero también de autenticidad.",
           "cartoon console":"Lleva en tu pantalla la consola que todos quisimos tener, esa que parece salida de un mundo de dibujos animados, tierna, colorida y mágica.",
           
           
           
           
           
           // Añade descripciones para las demás imágenes aquí
       ]
    private let interstitialAdUnitID = "ca-app-pub-4622872693950947/5863361532"
    //private let interstitialAdUnitID = "ca-app-pub-3940256099942544/4411468910" //
    
    
  
    
    var body: some View {
        NavigationView {
            VStack {
                // Barra de búsqueda y botón de idioma
                SearchBarView(searchText: $searchText, showLanguageAlert: $showLanguageAlert, isEnglish: $isEnglish)

                // Sección del reloj y las instrucciones
                ClockSectionView(selectedImageName: $selectedImageName, showInstruModal: $showInstruModal, isEnglish: $isEnglish)

                // Cuadrícula de imágenes
                ImageGridView(
                    selectedImageName: $selectedImageName,
                    showAlert: $showAlert,
                    showDescriptionAlert: $showDescriptionAlert,
                    isEnglish: $isEnglish,
                 //   showConfirmationMessage: $showConfirmationMessage, // Pasar el estado
                    images: images,
                    imageDescriptions: imageDescriptions,
                    filteredImages: filteredImages
                )
            }
            .background(Color.black.ignoresSafeArea())
        }
    }

    // Función para filtrar imágenes
    private func filteredImages() -> [String] {
        if searchText.isEmpty {
            return images
        } else {
            return images.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
