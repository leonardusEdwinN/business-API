//
//  String+Extension.swift
//  business-app
//
//  Created by Edwin Niwarlangga on 21/01/22.
//

import Foundation

import Foundation
extension String {
    
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
}
