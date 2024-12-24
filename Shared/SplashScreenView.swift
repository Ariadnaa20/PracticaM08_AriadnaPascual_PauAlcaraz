import SwiftUI

struct SplashScreenView: View {
    @State private var progress: Float = 0.0 // Estado de la barra de progreso

    var body: some View {
        VStack {
            Spacer() // Empuja todo hacia el centro

            // Logotipo
            Image(systemName: "checkmark.circle.fill") // Usa tu logotipo aquí
                .resizable()
                .frame(width: 100, height: 100) // Tamaño del logotipo
                .foregroundColor(.blue) // Color del logotipo

            // Texto
            Text("TrackIt")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)

            // Barra de progreso
            ProgressView(value: progress, total: 1.0) // Barra de progreso
                .progressViewStyle(LinearProgressViewStyle(tint: .blue)) // Estilo y color
                .padding(.horizontal, 40) // Espaciado horizontal
                .padding(.top, 20)

            Spacer() // Empuja todo hacia el centro
        }
        .onAppear {
            // Simular carga progresiva
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                if self.progress < 1.0 {
                    self.progress += 0.1 // Incremento de progreso
                } else {
                    timer.invalidate() // Detener el temporizador
                    // Navegar a la siguiente pantalla después de la carga
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}

