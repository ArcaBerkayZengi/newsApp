import SwiftUI

struct MainView: View {

    var body: some View {
        ZStack{
            TabView {
                ContentView()
                    .tabItem {
                        Label("News", systemImage: "house")
                    }

                FavoritesView()
                    .tabItem {
                        Label("Favorites", systemImage: "heart")
                    }

            }
            .accentColor(.red)
        }

    }
}
        struct mainView_Previews: PreviewProvider {
            static var previews: some View {
                MainView()
            }
        }
        
    

