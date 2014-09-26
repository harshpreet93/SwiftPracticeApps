//
//  ViewController.swift
//  PublicDictionary
//
//  Created by Harshpreet Singh on 6/28/14.
//  Copyright (c) 2014 Harshpreet Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet var resultTable : UITableView

    @IBOutlet var searchBar : UISearchBar
    @IBOutlet var wordSearch : UISearchBar
    var data: NSData!
    //var result: String[]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    

}