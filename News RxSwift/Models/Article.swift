//
//  Article.swift
//  News RxSwift
//
//  Created by Артур Дохно on 08.06.2022.
//

import Foundation

struct Article: Codable {
    let title: String
    let description: String?
}

struct ArticleList: Codable {
    let articles: [Article]
}

extension ArticleList {
    static var all: Resource<ArticleList> = {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=ch&apiKey=7ae44a7c68f9482da53f7cc3e89e0859")!
        return Resource(url: url)
    }()
}
