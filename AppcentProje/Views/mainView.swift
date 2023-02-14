import SwiftUI

struct mainView: View {
   
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        
        if !networkManager.isConnected {
            noNetworkView()
            
        }else{
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
                mainView()
            }
        }
        
    

