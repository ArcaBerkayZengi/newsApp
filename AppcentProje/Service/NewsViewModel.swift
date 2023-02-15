//
//  NewsData.swift
//  AppcentProje
//
//  Created by BZ on 27.01.2023.
//

import Foundation
import Alamofire



class NewsModel : ObservableObject {
   @Published var articles = [Article]()
    init() {
        getNews()
    }
    func getNews() {
        AF.request("https://newsapi.org/v2/everything?domains=wsj.com&apiKey=24e5de51c34548bc9e6b38642e33230b").responseDecodable(of:NewsApp.self) { response in
            
            
            switch response.result {
                
            case .success(let data):
                let article = data.articles
                self.articles = article
            
            case .failure(let error):
                print(error)
                
                
            }
            
            
                
        }
    }
    
    
}
