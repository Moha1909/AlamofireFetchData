//
//  user.swift
//  Almofilredemo
//
//  Created by Abinash Sahu on 15/05/17.
//  Copyright © 2017 jahid. All rights reserved.
//

import Foundation
import SwiftyJSON

class user {
    var name = String()
    var username = String()
    var email = String()
    var address = userAddress(addressJson: "address")
    var company = userCompany(companyJson: "company")
    
    
    
    init(userJson: JSON){
        self.name = userJson["name"].stringValue
        self.username = userJson["username"].stringValue
        self.email = userJson["email"].stringValue
        self.address = userAddress(addressJson: userJson["address"])
        self.company = userCompany(companyJson: userJson["company"])
        
    }
    
}

class userAddress{
    var street = String()
    var suite = String()
    var city = String()
    var zipcode = String()
    
    init(addressJson: JSON){
        self.street = addressJson["street"].stringValue
        self.suite = addressJson["suite"].stringValue
        self.city = addressJson["city"].stringValue
        self.zipcode = addressJson["zipcode"].stringValue
        
    }
}

class userCompany {
    var companyName = String()
    var phrase = String()
    
    init(companyJson: JSON){
        self.companyName = companyJson["name"].stringValue
        self.phrase = companyJson["catchPhrase"].stringValue
    }
}










