//
//  RowArticleVie.swift
//  UpNews
//
//  Created by yuki on 2024/05/17.
//
import SwiftUI
import WebViewKit

struct RowArticleView: View {
    private let model = NewsApiModel.shared
    let article:Article
    
    @Environment(\.openURL) var openURL
    
    var body: some View{
        
            NavigationLink(destination: WebView(urlString: article.url)){
                HStack{
                    if let urlToImage = article.urlToImage{
                        AsyncImage(url: URL(string: urlToImage)){ image in
                            image.resizable()
                                .frame(width: 60, height: 60)
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(10)
                        }placeholder: {
                            ProgressView()
                        }.frame(width: 60, height: 60)
                    }
                    VStack(alignment: .leading){
                        Text(article.title)
                            .padding(.leading)
                            .lineLimit(2)
                        HStack{
                            Spacer()
                            Text(model.getNewsFormatToDate(str: article.publishedAt))
                        }
                    }.foregroundColor(.black)
                }
            }
        }
    }



