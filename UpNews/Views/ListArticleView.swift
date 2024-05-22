//
//  ContentView.swift
//  UpNews
//
//  Created by yuki on 2024/05/17.
//

import SwiftUI

struct ListArticleView: View {

    @ObservedObject var model = NewsApiModel.shared
    @State var text:String = ""
    @State var category:NewsCategoryModel = .general

    var body: some View{
        VStack(spacing: 0){
            NewsheaderView()
            NavigationStack{
                NewsCategoryButtonsView(text: $text,category: $category)
                NewsSearchBoxView(text: $text,category: $category)
                if model.articles.count != 0{
                    List(self.model.articles){ article in
                        RowArticleView(article: article)
                    }
                    .listStyle(.plain)
                    .padding(0)
                }else{
                    Spacer()
                    Text("該当する記事がありません")
                    Spacer()
                }
            }
        }.onAppear{
            model.setArticle(params: NewsParametersModel(page: 1, pageSize: 100,category: nil,q: nil))
        }
    }
}

#Preview {
    ListArticleView()
}
