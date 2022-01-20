import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            DrinkMenu()
                .tabItem {
                    Label("Drinks", systemImage: "circle.fill")
                }
            FoodMenu()
                .tabItem {
                    Label("Food", systemImage: "icloud")
                }
            SettingsMenu()
                .tabItem  {
                    Label("Settings", systemImage: "square.and.pencil")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
