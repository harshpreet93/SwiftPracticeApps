//
//  ViewController.swift
//  Mortgage
//
//  Created by Harshpreet Singh on 7/13/14.
//  Copyright (c) 2014 Harshpreet Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
                            
    @IBOutlet var principal : UITextField!// = nil
    @IBOutlet var interestRate : UITextField!// = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        principal.text = "h"
        interestRate.text = "asdfas"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func updateView(sender : AnyObject) {
        principal.text = "Harshpreet"
    }

}

