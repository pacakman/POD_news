//
//  NewsTableViewCell.swift
//  POD_news
//
//  Created by Idris on 10/09/21.
//

import UIKit
import SkeletonView
class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    var isLoading: Bool = true {
        didSet {
            if isLoading {
                titleLabel.showAnimatedSkeleton()
                descriptionLabel.showAnimatedSkeleton()
            }
            else {
                titleLabel.hideSkeleton(reloadDataAfter: false, transition: .crossDissolve(0.25))
                descriptionLabel.hideSkeleton(reloadDataAfter: false, transition: .crossDissolve(0.25))
                titleLabel.stopSkeletonAnimation()
                descriptionLabel.stopSkeletonAnimation()
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func configureView(article: News) {
        titleLabel.text = article.title
        descriptionLabel.text = article.description
    }
}
