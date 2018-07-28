//
//  NewsHelper.swift
//  NewsML
//
//  Created by Ross Lubinski on 7/28/18.
//  Copyright © 2018 Ross Lubinski. All rights reserved.
//

import Foundation
import Alamofire

class NewsHelper {
    
    func getArticles() {
        
        Alamofire.request("https://newsapi.org/v2/top-headlines?country=us&apiKey=7a99487bfc4f4defb6b84284b2a69f9f").responseJSON { (response) in
            if let json = response.result.value as? [String:Any] {
                if let jsonArticles = json["articles"] as? [[String:Any]] {
                    var articles = [Article]()
                    for jsonArticle in jsonArticles {
                        guard let title = jsonArticle["title"] as? String,
                        let urlToImage = jsonArticle["urlToImage"] as? String,
                        let url = jsonArticle["url"] as? String,
                        let description = jsonArticle["description"] as? String
                            else {
                                continue
                        }
                        let article = Article()
                        article.title = title
                        article.urlToImage = urlToImage
                        article.url = url
                        article.description = description
                        articles.append(article)
                    }
                }
            }
        }
    }
}

class Article {
    var title = ""
    var urlToImage = ""
    var url = ""
    var description = ""
    var category = ""
}
