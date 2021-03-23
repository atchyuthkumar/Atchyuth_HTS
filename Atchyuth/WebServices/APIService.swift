//
//  APIService.swift
//  Atchyuth
//
//  Created by Smscountry on 17/03/21.
//

import Foundation

enum ServerResponse {
    case success
    case nill
    case failure
    
    init() {
        self = .success
    }
}

class WebService {
    
    static let sharedInstance: WebService = {
        let instace = WebService()
        return instace
    }()
    var server_status = ServerResponse()
    func getMethod(url_string: String, completionHandler: @escaping (_ data: [String: Any]) -> Void)  {
        
        let url = URL(string: url_string)
        let url_request = URLRequest(url: url!)
        let configuration = URLSessionConfiguration.default
        let urlSession = URLSession(configuration: configuration)
        var responseDict = [String: Any]()
        let dataTask = urlSession.dataTask(with: url_request) { (data, response, error) in
            if (data == nil) {
                self.server_status = .nill
                completionHandler(responseDict)
            } else {
                do {
                    if let jsonConvertedData = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String: Any] {
                        
                        print(jsonConvertedData)
                        responseDict = jsonConvertedData
                        self.server_status = .success
                        completionHandler(responseDict)
                    }
                } catch let error {
                    print("error is \(error.localizedDescription)")
                }
                
                
                
            }
        }
        dataTask.resume()
    }
    
    
    
    
    
    
    
    
}
