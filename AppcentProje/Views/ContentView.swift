

import SwiftUI
import Kingfisher
struct ContentView: View {
    
    @State private var isLoading = false
    @State private var searchText=""
    
   
    //------SearchBar filter function -------
    var filteredNews: [Article] {
        if searchText == "" {return newsVM.articles}
        return newsVM.articles.filter {
            $0.title.lowercased().contains(searchText.lowercased())
        }
    }
    
    //------Search bar filter function --------
    
    
    @ObservedObject var newsVM = NewsViewModel()
    var body: some View {
      
        NavigationView{
          
                List{
                    ForEach(filteredNews, id:\.self) { response in
                       
                        NavigationLink(destination: openURL(article: response)) {
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
                    .navigationTitle(Text("Appcent News"))
                
                    
            }.onAppear {
                Service.shared.getNews()
                
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

