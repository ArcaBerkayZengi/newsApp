

import SwiftUI
import Kingfisher
struct ContentView: View {
    
    @State private var isLoading = false
    @State private var searchText=""
    @StateObject var networkManager = NetworkManager()

    
    @ObservedObject var newsVM = NewsModel()
    var body: some View {

        NavigationView{
            if !networkManager.isConnected{
                NoNetworkView()
            }else{

                      List{
                          ForEach(newsVM.articles, id:\.self) { response in

                              NavigationLink(destination: OpenURL(article: response)) {
                                  HStack {

                                      // KingFisher
                                      KFImage(URL(string: response.urlToImage!))
                                          .resizable()
                                          .aspectRatio(contentMode: .fill)
                                          .frame(width: 100, height: 100)
                                          .cornerRadius(10)
                                      VStack(alignment: .leading, spacing: 4) {
                                          Text(response.title)
                                              .foregroundColor(.black)
                                              .font(.system(size: 18, weight:
                                                      .semibold))
                                              .lineLimit(3)
                                          Text(response.description!)
                                              .lineLimit(2)
                                              .foregroundColor(.black)
                                      }
                                  }

                              }

                          }
                          .onAppear{startNetworkCall()}
                          .redacted(reason: isLoading ? .placeholder : [])

                      }.searchable(text: $searchText)
                    .onChange(of: searchText, perform: { newValue in
                        newsVM.getNews(searchString: newValue)
                    })
                          .navigationTitle(Text("Appcent News"))
            }
                    
            }.onAppear {
                newsVM.getNews(searchString: self.searchText)
            }
        
        
        // content
            }
    func startNetworkCall() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isLoading = false

        }

    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

