//
//  HomeViewController.swift
//  POD_news
//
//  Created by Idris on 10/09/21.
//

import UIKit
class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let newsVM = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.registerNIB(with: NewsTableViewCell.self)
        loadingView = LoadingView.NIB()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setIsLoadingWithAlpha(true)
        callNewsApi()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func callNewsApi() {
        newsVM.getArticles { [weak self] (result) in
            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
            self?.setIsLoadingWithAlpha(false)
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsVM.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(with: NewsTableViewCell.self)
        cell.configureView(article: newsVM.selectedNEws(index: indexPath.row))
        return cell
    }
}
