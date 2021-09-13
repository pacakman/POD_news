//
//  NewsService.swift
//  POD_news
//
//  Created by Idris on 10/09/21.
//

import Foundation
import Moya
enum NewsService {
    case getArticles
}

extension NewsService: TargetType {
    var baseURL: URL {
        return URL(string: "https://newsapi.org/v2/")!
    }
    
    var path: String {
        return "top-headlines"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        var data: [String:Any] = [:]
        data["country"] = "us"
        data["category"] = "business"
        data["apiKey"] = "29c99d03194f4d46acbbceaa5cd22f9d"
        return .requestParameters(parameters: data, encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
