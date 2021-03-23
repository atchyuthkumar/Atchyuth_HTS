//
//  HomeModel.swift
//  Atchyuth
//
//  Created by Smscountry on 17/03/21.
//

import Foundation


class HomeModel
{
    
    var image = String()
    var title = String()
    var price = String()
    var dleagte: SampleProtocol?
    
    init(dict: Dictionary<String, Any>) {
        if let image = dict["image"] as? String {
            self.image = image
        }
        if let title = dict["title"] as? String {
            self.title = title
        }
        if let price = dict["price"] as? String {
            self.price = price
        }
      //  print(dleagte?.namegetting())
    }
   
}

class SomeNewClass {
    var anme = "cbv"
}

class Newdhf {
    
}



protocol SampleProtocol {
    func namegetting()
    var name : String {get}
    
    
}

struct newStruct: SampleProtocol {
    
    
    var name: String {
        return "dvgsd"
    }
    
    func namegetting() {
        
    }
    
    
}

extension SampleProtocol {
    func namegetting() {
        
    }
    
    var name: String {
        return "g"
    }
     
}

protocol FDHJH {
    
}


