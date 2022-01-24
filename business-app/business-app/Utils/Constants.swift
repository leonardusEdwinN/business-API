//
//  Constants.swift
//  business-app
//
//  Created by Edwin Niwarlangga on 21/01/22.
//

import Foundation

struct Constants {
    
    struct Urls {
        
        static func urlForSearchLocation(keyword: String) -> URL {
            return URL(string: "https://api.yelp.com/v3/businesses/search?\(keyword)")!
        }
        
        
        static func urlForGetID(id: String) -> URL {
            
            
            return URL(string: "https://api.yelp.com/v3/businesses/\(id)")!
        }
        
    }
    
    static let API_KEYS = "Pa45pYLwe-KFUcL7aQSIahvPw_ZfYVrG0RtP-Q92kQW7_LyxQMdfJ-icSHPYHPHr2p2QCOfI-kAKzdcIk6qmMZOdG4m0IUJtY8fJac6Lrzyf21M6Ez3Fs9XlH2_pYXYx"
    static let DefaultLocation = "NYC"
    
}
