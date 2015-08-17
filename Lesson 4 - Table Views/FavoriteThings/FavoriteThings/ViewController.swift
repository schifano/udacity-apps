//
//  ViewController.swift
//  FavoriteThings
//
//  Created by Rachel Schifano on 8/14/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Model - array of favorite things
    let favoriteThingsArray = [
        "Teddy bears",
        "Video games",
        "iOS Development"
    ]
    
    
    // Mark: Table View Data Source Methods

    /**
        Tells the data source to return the number of rows in a given section of a table view. (required)
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // How many cells do we need to have? Well, how many items are there to display?
        return self.favoriteThingsArray.count
    }
    
    
    /**
        Asks the data source for a cell to insert in a particular location of the table view. (required)
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FavoriteThingCell") as! UITableViewCell
        cell.textLabel?.text = self.favoriteThingsArray[indexPath.row]
        return cell
    }
}