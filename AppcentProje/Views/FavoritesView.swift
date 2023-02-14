

import SwiftUI

struct FavoritesView: View {
    
    @State var myNews = [""]
       
       var body: some View {
           NavigationView{
           if myNews == [""] {
               VStack{
              Image(systemName: "heart.slash.fill")
                    .font(.largeTitle)
                    .padding(.bottom)
              Text("You Have No Favorite News")
                   .font(.title)
                   .padding(.bottom)
                   
                   NavigationLink(destination: mainView(), label: {
                       Text("Show News")
                           .bold()
                           .frame(width: 280, height: 50)
                           .background(Color.red)
                           .foregroundColor(Color.white)
                           .cornerRadius(10)
                   })
              
                   
              
               }
           }else {
               List {
                   ForEach(myNews, id: \.self) { (fav) in
                       Text(fav)
                   }.onDelete(perform: self.deleteItem)
               }
           }
       }
       }
       private func deleteItem(at indexSet: IndexSet) {
           self.myNews.remove(atOffsets: indexSet)
       }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
