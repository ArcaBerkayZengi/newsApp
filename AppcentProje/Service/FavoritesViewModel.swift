//
//  FavoritesViewModel.swift
//  newsApp-Appcent
//
//  Created by BZ on 27.01.2023.
//

import Foundation
import CoreData
import SwiftUI

final class FavoritesViewModel: NSObject ,ObservableObject {

    func deleteItem(viewContext: NSManagedObjectContext, item: FetchedResults<NewsEntity>, offsets: IndexSet) {
        withAnimation {
            offsets.map { item[$0] }.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
