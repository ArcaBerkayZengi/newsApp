//
//  Service.swift
//  AppcentProje
//
//  Created by BZ on 27.01.2023.
//

import Foundation
import Alamofire

class Service {
    static let shared = Service()
    func getNews() {
        let request = AF.request("https://newsapi.org/v2/everything?domains=wsj.com&apiKey=24e5de51c34548bc9e6b38642e33230b")
            
        request.responseDecodable(of:NewsApp.self) { (response) in
            switch response.result {
                
            case .success(let data):
                let article = data.articles
               print(article)
                
            case .failure(let error):
                print(error)
                
                
            }
        }
    }
}
