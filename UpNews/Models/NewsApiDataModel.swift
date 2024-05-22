//
//  NewsApiDataModel.swift
//  UpNews
//
//  Created by yuki on 2024/05/17.
//
import UIKit

struct ArticleList: Codable{
    let articles: [Article]
}

struct Article: Codable,Identifiable{
    var id:UUID{
        return UUID()
    }
    let title: String
    let url: String
    let urlToImage: String?
    let publishedAt: String
    
    
init(title: String,url: String,urlToImage: String? = nil,publishedAt: String){
    self.title = title
    self.url = url
    self.urlToImage = urlToImage
    self.publishedAt = publishedAt
}
}
