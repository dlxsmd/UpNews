//
//  NewsQueryTypeButtonsView.swift
//  UpNews
//
//  Created by yuki on 2024/05/17.
//

import SwiftUI

struct NewsCategoryButtonsView: View {
    let model = NewsApiModel.shared
    @Binding var text:String
    @Binding var category:NewsCategoryModel
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack{
                ForEach(NewsCategoryModel.allCases){ type in
                    Button{
                        category = type
                        model.setArticle(params: NewsParametersModel(page: 1, pageSize: 100, category: type.rawValue,q: text))
                    }label:{
                        Text("\(type.japaneseLabel)")
                    }.padding(10)
                        .foregroundColor(category == type ? .blue : .white)
                        .background(category == type ? .white :.clear)
                        .font(.subheadline)
                }
                .cornerRadius(20)
            }.padding(10)
        }
        .background(Color.blue)
    }
}

#Preview {
    NewsCategoryButtonsView(text: .constant(""), category: .constant(.general))
}
