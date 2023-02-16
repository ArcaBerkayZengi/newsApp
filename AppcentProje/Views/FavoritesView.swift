

import SwiftUI

struct FavoritesView: View {
    
    @State var myNews = [""]

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(key: "savedDate", ascending: false)],
        animation: .default)
    var fetchedItemsfromCoreData: FetchedResults<NewsEntity>
    @Environment(\.managedObjectContext) var viewContext

    @StateObject var viewModel: FavoritesViewModel = .init()

    var body: some View {
        NavigationView{
            VStack{
                if fetchedItemsfromCoreData.isEmpty{
                    emptyFavoritesView
                }
                else{
                    fetchedListItemView
                }
            }
            .navigationTitle(Text("Favorites"))

        }


    }

}

extension FavoritesView{

    var emptyFavoritesView: some View {
        VStack(spacing: 12){
            Image(systemName: "heart.slash.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
                .padding(.bottom,1)
            Text("")
                .fontWeight(.bold)
                .font(.title)
            Text("You have no favorite news. ")
                .font(.title2)
                .foregroundColor(.gray)

                .foregroundColor(.black)
                .multilineTextAlignment(.center)
        }
    }

    var fetchedListItemView: some View {
        List{
            ForEach(fetchedItemsfromCoreData){ news in
                NavigationLink {
                    FavoritesDetailView(fetchedItemfromCoreData: news)
                } label: {
                    HStack{
                        AsyncImage(url: URL(string: news.imageURL!)!){ phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                    .padding(4)
                            case .failure:
                                Image("placeholder")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .padding(4)
                            @unknown default:
                                EmptyView()
                            }
                        }
                        VStack(alignment: .leading, spacing: 2){
                            Text(news.title ?? "")
                                .fontWeight(.semibold)
                            Text(news.content ?? "")
                                .font(.footnote)
                                .foregroundColor(.gray.opacity(0.5))
                        }
                        .lineLimit(2)

                    }
                }
            }
            .onDelete { indexSet in
                viewModel.deleteItem(viewContext: self.viewContext, item: self.fetchedItemsfromCoreData, offsets: indexSet)
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
