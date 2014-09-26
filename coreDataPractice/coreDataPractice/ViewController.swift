//
//  ViewController.swift
//  coreDataPractice
//
//  Created by Harshpreet Singh on 8/12/14.
//  Copyright (c) 2014 Harshpreet Singh. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {
                            
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var pasword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func load(sender: AnyObject) {
        var appDel: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context: NSManagedObjectContext = appDel.managedObjectContext!
        
        var request = NSFetchRequest(entityName: "User")
        request.returnsObjectsAsFaults = false
//        request.predicate = NSPredicate( format: "username = %@" , userName.text)
        var predicate = NSPredicate(format: "username = %@", userName.text)
        var predicate2 = NSPredicate(format: "password = %@", pasword.text)
        
        var compound = NSCompoundPredicate.andPredicateWithSubpredicates([predicate, predicate2])
        request.predicate = compound
        var results: NSArray = context.executeFetchRequest(request, error: nil)
        
        if(results.count>0){
//            for res in results
//            {
//                userName.text = res.
//                println(res)
//            }
            var res = results[0] as NSManagedObject
            userName.text = res.valueForKey("username") as String
            pasword.text = res.valueForKey("password") as String
            println("results found")
            
        }
        else{
            println("0 results returned.....potential error")
        }
        
    }

    @IBAction func save(sender: AnyObject) {
        var appDel: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context: NSManagedObjectContext = appDel.managedObjectContext!
        
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: context) as NSManagedObject
        newUser.setValue(userName.text, forKey: "username")
        newUser.setValue(pasword.text, forKey: "password")
        context.save(nil)
    }
}

