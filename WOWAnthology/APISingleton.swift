//
//  APISingleton.swift
//  WOWAnthology
//
//  Created by Caitlyn Daly on 12/13/18.
//  Copyright © 2018 Caitlyn Daly. All rights reserved.
//

import Foundation
import SwiftyJSON

typealias ServiceResponse = (JSON, NSError?) -> Void

class APISingleton : NSObject{
    static let sharedInstance = APISingleton()
    // MARK: Base URL
    let baseURL = "https://us.api.blizzard.com/data/wow/"
    let apiTocken = "&access_token=USMvOtydef4NMmy6ijoBb3E6IoSAxsAPrR"
    var request : NSMutableURLRequest = NSMutableURLRequest()
    

    
    // MARK: GET Request
    func getDataFromAPI(url:String,dataToGrab:String){
        let endpoint = URL(string: "https://us.api.blizzard.com/data/wow/race/index?namespace=static-us&locale=en_US&access_token=USMvOtydef4NMmy6ijoBb3E6IoSAxsAPrR")
        let data = try? Data(contentsOf: endpoint!)
        if let json = (try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers)) as? [String: Any]{
            if let races = json["races"] as? Array<[String:Any]>{
                for race in races{
                    print("\(race)")
                }
            }
        }
    }
    
    // MARK: POST request
    
}

