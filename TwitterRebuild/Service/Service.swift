//
//  Service.swift
//  TwitterRebuild
//
//  Created by RickYip on 20/7/2018.
//  Copyright © 2018年 RickYip. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    static let sharedInstance = Service()
    
    func fetchHomeFeed(completion: @escaping (HomeDatasource) -> ()){
        let request: APIRequest<HomeDatasource, JSONError> = tron.swiftyJSON.request("/twitter/home")
        
        request.perform(withSuccess: { (homeDatasource) in
            print("Success  fetchHomeFeed  ")
            completion(homeDatasource)
        }) { (err) in
            print("Err  fetchHomeFeed  ", err)
        }
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) {
            print("Json error")
        }
    }
}
