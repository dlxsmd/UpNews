//
//  NewsQueryModel.swift
//  UpNews
//
//  Created by yuki on 2024/05/17.
//

import UIKit

enum NewsCategoryModel:String,Encodable,CaseIterable,Identifiable{
    var id:String{self.rawValue}
    
    case general
    case business
    case entertainment
    case health
    case science
    case sports
    case technology
    
    var japaneseLabel: String {
           switch self {
           case .general: return "全般"
           case .business: return "ビジネス"
           case .entertainment: return "エンタメ"
           case .health: return "健康"
           case .science: return "科学"
           case .sports: return "スポーツ"
           case .technology: return "テクノロジー"
           }
       }
}





