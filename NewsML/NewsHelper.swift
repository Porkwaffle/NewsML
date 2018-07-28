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
            <#code#>
        }
    }
}
