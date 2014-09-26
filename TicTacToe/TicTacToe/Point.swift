//
//  Point.swift
//  TicTacToe
//
//  Created by Harshpreet Singh on 8/19/14.
//  Copyright (c) 2014 Harshpreet Singh. All rights reserved.
//

import Foundation

class Point{
    var row: Int
    var column: Int
    var chosen: Bool
    
    init(row: Int, column: Int){
        self.row = row
        self.column = column
        self.chosen = false
    }
    
    func toString()->String{
        return "\n Row = " + String(self.row) + "\n" + "Column = " + String(self.column) + "\n"
    }
}