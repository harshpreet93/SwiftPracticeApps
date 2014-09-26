//
//  ViewController.swift
//  coreDataPractice2
//
//  Created by Harshpreet Singh on 8/17/14.
//  Copyright (c) 2014 Harshpreet Singh. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
                            
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    @IBAction func btnLoad(sender: AnyObject) {
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        let request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "username = %@", txtUserName.text)
        
        var results:NSArray = context.executeFetchRequest(request, error: nil)
        
        if results.count > 0 {
            for user in results{
                var thisUser = user as Users
                println("The users username is \(thisUser.username) ")
                println("The users password is \(thisUser.password) ")
            }
            
        }
        else{
            println("No Results Found")
        }
        
    }
    
    
    @IBAction func btnSave(sender: AnyObject) {
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        let ent = NSEntityDescription.entityForName("Users", inManagedObjectContext: context)
        var newUser = Users(entity: ent, insertIntoManagedObjectContext: context)
        newUser.username = txtUserName.text
        newUser.password = txtPassword.text
        
        context.save(nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

