//
//  NewsViewModel.swift
//  AppcentProje
//
//  Created by BZ on 27.01.2023.
//

import Foundation


struct NewsApp: Codable, Hashable {
    let articles: [Article]
}

struct Article: Codable, Hashable {
    let source: Source
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
    let author: String?
    let content: String?

}

struct Source: Codable, Hashable {
    let name: String
}

extension Article {
    static let dummyData = Article(source: Source(name: "HaberTürk"), title: "Haber Başlığı",description: "Haber içeriği...",url: "https://www.wsj.com/articles/our-political-parties-are-struggling-republicans-democrats-gop-wokeness-election-george-santos-elected-11675374507", urlToImage: "",     publishedAt: "14 Ocak 2023", author: "Yazar İsmi" , content: "GOP Lawmaker’s Two Jobs: Investigating Bidens, Managing FirebrandsWASHINGTON—The Republican leading several investigations related to President Biden and his administration faces the dual challenge")
}


