//
//  NewsSearchBoxV.swift
//  UpNews
//
//  Created by yuki on 2024/05/17.
//

import SwiftUI

struct NewsSearchBoxView: View {
    let model = NewsApiModel.shared
    @Binding var text:String
    @Binding var category:NewsCategoryModel
    @FocusState var isActive:Bool
    
    var body: some View {
        
        HStack{
            TextField("検索キーワード",text: $text)
                .textFieldStyle(.roundedBorder)
                .padding(5)
                .keyboardType(.default)
                .focused($isActive)
                .toolbar{
                    ToolbarItem(placement: .keyboard){
                        Button{
                            isActive = false
                        }label: {
                            Spacer()
                            Text("閉じる")
                        }.foregroundColor(Color.blue)
                    }
                }
            
            Button{
                model.setArticle(params: NewsParametersModel(page: 1, pageSize: 100, category: category.rawValue, q: text))
            }label: {
                Image(systemName: "magnifyingglass")
            }.padding(5)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(40)
        }.padding(5)
    }
}
                        

