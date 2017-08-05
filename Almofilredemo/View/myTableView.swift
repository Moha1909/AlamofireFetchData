//
//  myTableView.swift
//  Almofilredemo
//
//  Created by Abinash Sahu on 06/08/17.
//  Copyright © 2017 jahid. All rights reserved.
//

import UIKit

class myTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var dataSourceArray = [user](){
        didSet{
            reloadData()
        }
    }
    override init(frame: CGRect, style: UITableViewStyle) {
        super .init(frame: frame, style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
       // fatalError("init(coder:) has not been implemented")
        super .init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super .awakeFromNib()
        self.delegate = self
        self.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! alamofireTableViewCell
        let myUser = self.dataSourceArray[indexPath.row]
        
        cell.addressLbl.text = myUser.address.city
        cell.companyLbl.text = myUser.company.companyName
        cell.emailLbl.text = myUser.email
        cell.nameLbl.text = myUser.name
        cell.userNamelbl.text = myUser.username
        
        
        
        return cell
    }
}
