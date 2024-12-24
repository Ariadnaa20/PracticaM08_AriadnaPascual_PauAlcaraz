import SwiftUI

struct ContentView: View {
    @State private var showMainView = false

    var body: some View {
        if showMainView
        {
            MainView() // La vista principal de tu app
        } else {
            SplashScreenView()
                .onAppear {
                    // Cambiar a la vista principal después de 3 segundos
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            showMainView = true
                        }
                    }
                }
        }
    }
}

struct MainView: View {
    var body: some View {
        Text("¡Bienvenido a TrackIt!") // Pantalla principal
            .font(.largeTitle)
            .fontWeight(.bold)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

