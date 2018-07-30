//
//  ArticleTableViewController.swift
//  NewsML
//
//  Created by Ross Lubinski on 7/28/18.
//  Copyright © 2018 Ross Lubinski. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleTableViewController: UITableViewController {
    
    var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getArticles()
        
        //Remove table lines
        tableView.separatorStyle = .none
    }
    
    func getArticles() {
        NewsHelper().getArticles { (articles) in
            self.articles = articles
            self.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? ArticleCell {
            
            let article = articles[indexPath.row]
            cell.titleLabel.text = article.title
            cell.categoryLabel.text = article.category.rawValue
            cell.categoryLabel.backgroundColor = article.categoryColor
            
            //Use Kingfisher to set image
            let url = URL(string: article.urlToImage)
            cell.articleImageView.kf.setImage(with: url, placeholder: UIImage(named: "defaultImage"), options: nil, progressBlock: nil, completionHandler: nil)
            
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        performSegue(withIdentifier: "goToURL", sender: article)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToURL" {
            if let article = sender as? Article {
                if let webVC = segue.destination as? ArticleWebViewController {
                    webVC.article = article
                }
            }
        }
    }
    
    @IBAction func reloadTapped(_ sender: UIBarButtonItem) {
        getArticles()
    }
}

class ArticleCell : UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
}
