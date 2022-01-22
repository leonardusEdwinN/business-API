//
//  ListBusinessViewModel.swift
//  business-app
//
//  Created by Edwin Niwarlangga on 21/01/22.
//

import Foundation
class ListBusinessViewModel{
    private var listBusinessResponse = [BusinessViewModel]()
    private var page : Int = 1

    
    func numberOfRows(_ section: Int) -> Int {
        return listBusinessResponse.count
    }
    
    func modelAt(_ index: Int) -> BusinessViewModel {
        return listBusinessResponse[index]
    }
    
    func getBusinessFromKeyword(keyword : String,isNext: Bool, completion: @escaping ([BusinessViewModel]) -> Void) {
        
        if(listBusinessResponse.count > 0 && !isNext){
            
            //kalau ada data
            listBusinessResponse = []
        }
        
        
        var urlRequest = URLRequest(url:  Constants.Urls.urlForSearchLocation(keyword: keyword))
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(Constants.API_KEYS)",forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "GET"

        Webservice().loadPOST(resource: urlRequest) { (result) in
            
            if let business = result {
                do{
                    let dataDecoder = try JSONDecoder().decode(BusinesssResponses.self, from: business)
                    
                    if let businessResponses = dataDecoder.businesses{
                        for business in businessResponses{
                            self.listBusinessResponse.append(BusinessViewModel(business: business))
                        }
                    }
                   
                    completion(self.listBusinessResponse)
                  } catch let parsingError {
                     print("Error", parsingError)
                }
            }
        }
    }
    
    
}


class BusinessViewModel {

    let item: Businesses

    init(business: Businesses) {
        self.item = business
    }
}

