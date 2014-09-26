//
//  YQLQuery.swift
//  YQLUtil
//
//  Created by Harshpreet Singh on 8/31/14.
//  Copyright (c) 2014 Harshpreet Singh. All rights reserved.
//

import Foundation

class YQLQuery {
    init() {
        
    }


func makequery(symbol: String) {
    
}

func findAllStocksLessThan(price: Float) {
    
    var urlString:String = ( "http://query.yahooapis.com/v1/public/yql?q= select company from yahoo.finance.industry where id in (select industry.id from yahoo.finance.sectors) &format=json&env=http://datatables.org/alltables.env" ).stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
    var url : NSURL = NSURL.URLWithString(urlString)
    var request: NSURLRequest = NSURLRequest(URL:url)
    let config = NSURLSessionConfiguration.defaultSessionConfiguration()
    let session = NSURLSession(configuration: config)
    
    //3: Completion block/Clousure for the NSURLSessionDataTask
    let task : NSURLSessionDataTask = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
        
        if((error) != nil) {
            println(error.localizedDescription)
        }
        else {
            var err: NSError?
            //4: JSON process
            var jsonDict = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSDictionary
            //                print(jsonDict)
            if(err != nil) {
                println("JSON Error \(err!.localizedDescription)")
            }
            else {
                //5: Extract the Quotes and Values and send them inside a NSNotification
                var quotes:NSArray = (jsonDict["query"] as NSDictionary) ["results"]! ["industry"]! as NSArray//.objectForKey("results").objectForKey("quote")! as NSArray
                for i in quotes{
//                    print("dictionary is: ")
                    print(i)
                }
            }
        }
    })
    
    //6: DONT FORGET to LAUNCH the NSURLSessionDataTask!!!!!!
    task.resume()
    
}

}
