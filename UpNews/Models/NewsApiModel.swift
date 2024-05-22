//
//  NewsApiModel.swift
//  UpNews
//
//  Created by yuki on 2024/05/17.
//

import UIKit
import Alamofire
import Combine

class NewsApiModel: ObservableObject {
    private let apiUrl:String = "https://newsapi.org/v2/top-headlines?country=jp&apiKey=4797d161340241ceb1f87f1eefcc513b"
    private let df = DateFormatter()

    public static let shared = NewsApiModel()
    
    @Published var articles:[Article] = []
    

    public func fetchData(params:NewsParametersModel?,completion:@escaping([Article]) -> Void){
        
        AF.request(apiUrl,parameters:params)
            .responseData{ response in
                switch response.result {
                case .success(let data):
                    do {
                        let decoder = JSONDecoder()
                        let articleList = try decoder.decode(ArticleList.self, from: data)
                        DispatchQueue.main.async {
                            self.articles = articleList.articles
                            print(self.articles)
                            completion(articleList.articles)
                        }
                    } catch {
                        print("error: \(error)")
                    }
                case .failure(let error):
                    print("error: \(error)")
                }
            }
    }
    public func getNewsFormatToDate(str:String) -> String{
                df.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            guard let date = df.date(from: str) else { return str }
                df.dateFormat = "yyyy/MM/dd HH:mm"
                return df.string(from: date)
    }
    
    public func setArticle(params:NewsParametersModel?){
        fetchData(params:params){ array in
            DispatchQueue.main.async {
                self.articles = array
            }
        }
    }
}
