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

    func getNews(searchString: String?) {
        AF.request(String.combineWithAndSymbol(strings: [Constant.API.apiHomeEverything + (searchString ?? Constant.API.constantSearchTerm), Constant.API.domainsParameter + Constant.API.domain, Constant.API.apiParameter + Constant.API.apiKey   ])).responseDecodable(of:NewsApp.self) { response in
            
            
            switch response.result {
                
            case .success(let data):
                self.articles = data.articles
            
            case .failure(let error):
                print(error)
                
                
            }
        }
    }
    
    
}
