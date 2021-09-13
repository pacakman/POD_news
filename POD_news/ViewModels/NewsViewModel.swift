//
//  NewsViewModel.swift
//  POD_news
//
//  Created by Idris on 13/09/21.
//

import Foundation
class NewsViewModel {
    var useCase: NewsUseCase = NewsUseCase()
    var articles: [News] = []
    var isLoading: Bool = true
    
    func getArticles(completion: @escaping (Result<Bool, Error>) -> Void) {
        useCase.getArticles { [weak self] (result) in
            switch result {
            case .success(let news):
                self?.articles = news.articles
                completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func selectedNEws(index: Int) -> News {
        return articles[index]
    }
}
