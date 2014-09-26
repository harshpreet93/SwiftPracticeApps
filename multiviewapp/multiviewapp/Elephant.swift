//
//  Elephant.swift
//  multiviewapp
//
//  Created by Harshpreet Singh on 8/7/14.
//  Copyright (c) 2014 Harshpreet Singh. All rights reserved.
//

import Foundation

class Elephant
{
    var weight: Float
    
    var name: String

    var continentOfOrigin: String
    
    init()
    {
        self.weight = 0
        self.name = ""
        self.continentOfOrigin = ""
    }
    
    init(weight: Float, name: String, continentOfOrigin: String)
    {
        self.weight = weight
        self.name = name
        self.continentOfOrigin = continentOfOrigin
    }
    
    
}