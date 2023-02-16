import SwiftUI
import Kingfisher

struct OpenURL: View {

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(key: "savedDate", ascending: false)],
        animation: .default)
     var fetchedItemsfromCoreData: FetchedResults<NewsEntity>
    @Environment(\.managedObjectContext) var viewContext
    @State var isFavorited : Bool = false
    @State private var showingAlert = false
    @StateObject var viewModel: OpenURLViewModel = .init()
    let article : Article

    var body: some View {
        
        VStack{
            ScrollView{
                KFImage(URL(string: article.urlToImage ?? "noPhoto"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 350, height: 200)
                    .cornerRadius(7)
                    .padding(.top,20)
                VStack(spacing:10){
                    Text(article.title)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.all)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .font(Font.custom("NewsCycle-Bold", size: 20))
                        .foregroundColor(.white)
                    Text(article.description ?? "No Desc.")
                        .font(.body)
                        .padding(.leading)
                        .padding(.trailing)
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            
            
            Button(action: {}, label: {
                NavigationLink(destination: Webview(url: article.url ?? "")) {
                    HStack{
                        Text("News Source")
                            .font(.title3)
                        Image(systemName: "arrowshape.turn.up.right.fill")
                    }
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.white.opacity(0.9), radius: 5, x: 0.0, y:4)
                    
                }
            })
            .buttonStyle(PlainButtonStyle())
            .padding(40)
            
            .navigationBarItems(trailing: HStack {
                Button(action: shareNews) {
                    Image(systemName: "square.and.arrow.up")
                        .padding(2)
                        .font(.title2)
                        .foregroundColor(.white)
                }
                Button(action: {
                    self.isFavorited.toggle()
                    // MARK: SAVE TO CORE DATA
                    self.viewModel.addNewstoCoreData(fetchedItemsfromCoreData: self.fetchedItemsfromCoreData, viewContext: self.viewContext, article: article) { resultBool in
                        // MARK: CHECK IT IS SUCCESFULLY SAVED OR NOT

                        if resultBool {
                            // MARK: SAVED TO CORE DATA

                        }
                        else{
                            // MARK: NOT SAVED TO CORE DATA
                            self.showingAlert.toggle()
                        }
                    }
                    
                }) {
                    Image(systemName: self.isFavorited == true ? "suit.heart.fill" : "heart")
                        .padding(2)
                        .font(.title2)
                        .foregroundColor(isFavorited ? .red : .white)
                    
                }
            })
        }.background(Color.black)
            .alert("Item is already saved", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            }
    }
    
    func shareNews() {
        
        let url = URL(string: Article.dummyData.url ?? "")
        let activityController = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
        
        UIApplication.shared.keyWindow?.rootViewController!.present(activityController, animated: true, completion: nil)
    }
    
    struct openURL_Previews: PreviewProvider {
        static var previews: some View {
            OpenURL(article:  Article.dummyData)
            
        }
    }
    
    
}

