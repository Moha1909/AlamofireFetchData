//
//  ViewController.swift
//  Almofilredemo
//
//  Created by Abinash Sahu on 15/05/17.
//  Copyright © 2017 jahid. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController{

    
    @IBOutlet weak var myTable: myTableView!

    
    var myResponse: JSON = JSON.null
    
    var users: [user] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchUser()
        
    }
    
    func fetchUser(){
        
        APIManager.sharedInstance.getUserFromServer(){(userJson) -> Void in
            
            if userJson != JSON.null{
                self.myResponse = userJson
                
                for i in 0..<self.myResponse.count{
                    let singleuser = user(userJson: self.myResponse[i])
                    self.users.append(singleuser)
                }
                
                DispatchQueue.main.async {
                    self.myTable.dataSourceArray = self.users
                }
            }
            
    }


}

}
