//
//  OpenURLViewModel.swift
//  newsApp-Appcent
//
//  Created by Created by BZ on 27.01.2023
//

import Foundation
import CoreData
import SwiftUI

final class OpenURLViewModel: NSObject ,ObservableObject {
    
    func addNewstoCoreData(fetchedItemsfromCoreData: FetchedResults<NewsEntity>,viewContext: NSManagedObjectContext, article: Article, completion: @escaping (Bool) -> Void) {
        if fetchedItemsfromCoreData.contains(where: { $0.newsURL == article.url }) {
            completion(false)
            return
        } else {
            withAnimation {
                let newsItem = NewsEntity(context: viewContext)
                newsItem.newsURL = article.url
                newsItem.content = article.content
                newsItem.imageURL = article.urlToImage
                newsItem.title = article.title
                newsItem.savedDate = Date()

                do {
                    try viewContext.save()
                    completion(true)
                } catch {

                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
            }
        }

    }

    func deleteItem(viewContext: NSManagedObjectContext, item: FetchedResults<NewsEntity>.Element) {
        withAnimation {
            viewContext.delete(item)
            do {
                try viewContext.save()
            } catch {

                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

