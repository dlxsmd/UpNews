//
//  NewsheaderView.swift
//  UpNews
//
//  Created by yuki on 2024/05/21.
//

import SwiftUI

struct NewsheaderView: View {
    var body: some View {
        Text("News")
            .frame(width: UIScreen.main.bounds.width)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .font(.system(.title, design: .monospaced))
    }
}

#Preview {
    NewsheaderView()
}



