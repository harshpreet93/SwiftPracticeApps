//
//  ViewController.swift
//  quave_tutorial_1
//
//  Created by Harshpreet Singh on 6/29/14.
//  Copyright (c) 2014 Harshpreet Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
                            
    @IBOutlet var tableView : UITableView
    var tableData: NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchItunesFor("JQ Software")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return tableData.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cell: UITableViewCell = UITableViewCell(style:
            UITableViewCellStyle.Subtitle, reuseIdentifier:"MyTestCell")
        
        cell.text = "Row #\(indexPath.row)"
        cell.detailTextLabel.text = "Subtitle #\(indexPath.row)"
        return cell
    }
    
    func searchItunesFor(searchTerm: String)
    {
        var itunesSearchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ",
            withString: "+", options: NSStringCompareOptions.CaseInsensitiveSearch, range:
            nil)
        
        var escapedSearchTerm =
        itunesSearchTerm.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        
        var urlPath = "https://itunes.apple.com/search?term=\(escapedSearchTerm)&media=software"
        
        var url: NSURL = NSURL(string: urlPath)
        
        var session = NSURLSession.sharedSession()
        
        var task = session.dataTaskWithURL( url
            , completionHandler: {data, response, error -> Void in
                println("Task completed")
                if(error)
                {
                    println(error.localizedDescription)
                }
                
                var err: NSError?
                var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSDictionary
                if(err?)
                {
                    println("JSON Error \(err!.localizedDescription)")
                }
                var results: NSArray = jsonResult["results"] as NSArray
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableData = results
                    self.tableView.reloadData()
                })
        })
        
        
        
    }


}

