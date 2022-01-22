//
//  Constants.swift
//  business-app
//
//  Created by Edwin Niwarlangga on 21/01/22.
//

import Foundation

struct Constants {
    
    struct Urls {
        // MARK: Source
        static func urlForGetSourceFromCategory(category : String, pageSize : Int, page: Int) -> URL {
            return URL(string: "https://newsapi.org/v2/top-headlines/sources?apiKey=\(Constants.API_KEYS)&category=\(category.escaped())")!
        }
        
        
        // MARK: ARTICLES
        static func urlForGetNewsFromSourceName(sourceKeyword: String, pageSize : Int, page: Int) -> URL {
//            print("https://newsapi.org/v2/top-headlines?sources=\(sourceKeyword.escaped())&apiKey=\(Constants.API_KEYS)&page=\(page)&pageSize=\(pageSize)")
            return URL(string: "https://newsapi.org/v2/top-headlines?sources=\(sourceKeyword.escaped())&apiKey=\(Constants.API_KEYS)&page=\(page)&pageSize=\(pageSize)")!
        }
        
        static func urlForGetNewsFromKeyword(keyword: String, pageSize : Int, page: Int) -> URL {
            return URL(string: "https://newsapi.org/v2/top-headlines?apiKey=\(Constants.API_KEYS)&q=\(keyword.escaped())&pageSize=\(pageSize)&page=\(page)")!
        }
        
        static func urlForSearchLocation(keyword: String) -> URL {
            print("URL = https://api.yelp.com/v3/businesses/search?location=\(keyword)")
            return URL(string: "https://api.yelp.com/v3/businesses/search?location=\(keyword)")!
        }
        
    }
    
    static let API_KEYS = "Pa45pYLwe-KFUcL7aQSIahvPw_ZfYVrG0RtP-Q92kQW7_LyxQMdfJ-icSHPYHPHr2p2QCOfI-kAKzdcIk6qmMZOdG4m0IUJtY8fJac6Lrzyf21M6Ez3Fs9XlH2_pYXYx"
    
    
}
