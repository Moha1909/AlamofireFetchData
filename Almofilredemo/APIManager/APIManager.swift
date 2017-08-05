//
//  APIManager.swift
//  Almofilredemo
//
//  Created by Abinash Sahu on 06/08/17.
//  Copyright © 2017 jahid. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIManager{
    
    static let sharedInstance = APIManager()
    private init() {
    }
    
    func getUserFromServer(onCompletion:@escaping (JSON) -> Void){
        
        let url = NSURL(string: FETCH_USER_URL)
        var request = URLRequest(url: url! as URL)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
        
        
        Alamofire.request(request).responseJSON { (response) in
            switch response.result {
            case .success(let data):
                print("Successfully grabbed response",data)
                print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
                let response = JSON(data)
                onCompletion(response)
                
            case .failure(let error):
                print("Response failed with \(error)")
                onCompletion(JSON.null)
            }
            
        }
    }
    
   
}
