//
//  FavoritesDetailView.swift
//  newsApp-Appcent
//
//  Created by BZ on 27.01.2023.
//

import SwiftUI

struct FavoritesDetailView: View {
    var fetchedItemfromCoreData: FetchedResults<NewsEntity>.Element
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack{
                AsyncImage(url: URL(string: fetchedItemfromCoreData.imageURL!)!){ phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 240, height: 240)
                            .padding(4)
                    case .failure:
                        Image("placeholder")
                            .resizable()
                            .frame(width: 240, height: 240)
                            .padding(4)
                    @unknown default:
                        EmptyView()
                    }
                }
                VStack(alignment: .leading, spacing: 24){
                    Text(fetchedItemfromCoreData.title ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)

                    Text(fetchedItemfromCoreData.content ?? "")
                }
            }
            .padding(.horizontal)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
