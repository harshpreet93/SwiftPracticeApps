//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Harshpreet Singh on 6/19/14.
//  Copyright (c) 2014 Harshpreet Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var name: UITextField
    
    @IBOutlet var asdfa : UITextView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttonPressed(sender: AnyObject)
    {
        asdfa.text="Hello "+name.text
        name.text=""
    }


}

