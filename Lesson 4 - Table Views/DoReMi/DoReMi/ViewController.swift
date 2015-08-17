//
//  ViewController.swift
//  DoReMi
//
//  Created by Rachel Schifano on 8/17/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let reuseIdentifier: String = "CellReuseIdentifier"
    
    // Model - Data for DoReMi
    let model = [
        ["text" : "Do", "detail" : "A deer. A female deer."],
        ["text" : "Re", "detail" : "A drop of golden sun."],
        ["text" : "Mi", "detail" : "A name, I call myself."],
        ["text" : "Fa", "detail" : "A long long way to run."],
        ["text" : "So", "detail" : "A needle pulling thread."],
        ["text" : "La", "detail" : "A note to follow So."],
        ["text" : "Ti", "detail" : "A drink with jam and bread."]
    ]

    /**
        Tells the data source to return the number of rows in a given section of a table view. (required)
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in a given section of a table view
        return self.model.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(self.reuseIdentifier) as! UITableViewCell
        
        // Create dictionary for accessing data
        let dictionary = self.model[indexPath.row]
        
        cell.textLabel?.text = dictionary["text"]
        cell.detailTextLabel?.text = dictionary["detail"]
        
        return cell
    }
}