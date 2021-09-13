//
//  NewsUseCase.swift
//  POD_news
//
//  Created by Idris on 13/09/21.
//

import Foundation
import Moya
struct NewsUseCase {
    let provider = MoyaProvider<NewsService>()
    static let shared = NewsUseCase()
    
    func getArticles(completion: @escaping (Result<NewsList,Error>) -> Void) {
        provider.request(.getArticles) { (result) in
            switch result {
            case .success(let response):
                do {
                    let model = response.data
                    let news = try JSONDecoder().decode(NewsList.self, from: model)
                    completion(.success(news))
                }
                catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
