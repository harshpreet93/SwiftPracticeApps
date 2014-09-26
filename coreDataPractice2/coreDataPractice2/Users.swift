//
//  Users.swift
//  coreDataPractice2
//
//  Created by Harshpreet Singh on 8/17/14.
//  Copyright (c) 2014 Harshpreet Singh. All rights reserved.
//

import UIKit
import CoreData

@objc(Users)
class Users: NSManagedObject {
    
    @NSManaged var username: String
    @NSManaged var password: String
    
    func toString() -> String{
        return "The username is \(username) their password is \(password)"
    }
    
    func addFunnyPrefix(prefix: String){
        username = prefix + username
    }
    
   
}
