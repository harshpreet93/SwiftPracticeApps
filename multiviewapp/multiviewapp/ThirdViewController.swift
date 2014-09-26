//
//  ThirdViewController.swift
//  multiviewapp
//
//  Created by Harshpreet Singh on 8/8/14.
//  Copyright (c) 2014 Harshpreet Singh. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    var arrayOfElephants: [Elephant] = []
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var continentOfOrigin: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = arrayOfElephants[2].name
        weight.text = String(format: "%.2f", arrayOfElephants[2].weight)
        continentOfOrigin.text = arrayOfElephants[2].continentOfOrigin
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        var vc2 = segue!.destinationViewController as SecondViewController
        vc2.arrayOfElephants = self.arrayOfElephants
    }

}
