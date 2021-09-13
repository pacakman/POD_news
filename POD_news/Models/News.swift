//
//  Articles.swift
//  POD_news
//
//  Created by Idris on 13/09/21.
//

import Foundation
struct NewsList: Decodable {
    let status: String
    let totalResults: Int
    let articles: [News]
}

struct News: Decodable {
    let title: String?
    let description: String?
}
