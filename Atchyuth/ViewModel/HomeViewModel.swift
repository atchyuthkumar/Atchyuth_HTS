//
//  HomeViewModel.swift
//  Atchyuth
//
//  Created by Smscountry on 17/03/21.
//

import Foundation

class HomeViewModel
{
    static let sharedInstance: HomeViewModel = {
            let instace = HomeViewModel()
            return instace
        }()
    var booksModelData = [HomeModel]()
    
    func callApi(url_string: String, completed: @escaping(_ modelData: [HomeModel]) -> Void)  {
        WebService.sharedInstance.getMethod(url_string: url_string) { (data) in
            
            
            switch WebService.sharedInstance.server_status {
            
            case.failure:
                print("Throw error response or internet connection")
            
            case.nill:
                print("Throw error response or internet connection")
                           
            case.success:
                print(data)
                if let outputdata = data as? [String: Any]  {
                  // need to model connection here
                    
                    if let booksArray = outputdata["books"] as? [[String: Any]] {
                        
                        for record in booksArray {
                            self.booksModelData.append(HomeModel(dict: record))
                        }
                        completed(self.booksModelData)
                    }
                }
            }
        }
    }
}
