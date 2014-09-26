//
//  ViewController.swift
//  multiviewapp
//
//  Created by Harshpreet Singh on 8/6/14.
//  Copyright (c) 2014 Harshpreet Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var continentOfOrigin: UILabel!
    var arrayOfElephants: [Elephant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        println("testVar")
        let e1 = Elephant(weight: 150.0, name: "Adam", continentOfOrigin: "Africa")
        let e2 = Elephant(weight: 145, name: "Blake", continentOfOrigin: "Africa")
        let e3 = Elephant(weight: 160, name: "Ders", continentOfOrigin: "Africa" )
        arrayOfElephants.append(e1)
        arrayOfElephants.append(e2)
        arrayOfElephants.append(e3)
        
        // Do any additional setup after loading the view, typically from a nib.
        weight.text = String(format: "%.2f", arrayOfElephants[0].weight )
        name.text = arrayOfElephants[0].name
        continentOfOrigin.text = arrayOfElephants[0].continentOfOrigin
        
        
    }

    @IBAction func displayAlert(sender: AnyObject)
    {
        var alert = UIAlertController(title: "Alert", message: "Can't go back anymore", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!)
    {
        var vc2 = segue!.destinationViewController as ViewController
        
        vc2.arrayOfElephants = self.arrayOfElephants
    }


}

