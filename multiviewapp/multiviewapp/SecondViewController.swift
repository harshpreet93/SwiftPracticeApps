//
//  SecondViewController.swift
//  multiviewapp
//
//  Created by Harshpreet Singh on 8/7/14.
//  Copyright (c) 2014 Harshpreet Singh. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var arrayOfElephants: [Elephant] = []
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var continentOfOrigin: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //println(arrayOfElephants[0].name)
        // Do any additional setup after loading the view.
        name.text = arrayOfElephants[1].name
        weight.text = String(format: "%.2f", arrayOfElephants[1].weight)
        continentOfOrigin.text = arrayOfElephants[1].continentOfOrigin
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if(segue!.identifier != "back")
        {
            var vc3 = segue!.destinationViewController as ThirdViewController
            vc3.arrayOfElephants = self.arrayOfElephants
        }
    }


}
