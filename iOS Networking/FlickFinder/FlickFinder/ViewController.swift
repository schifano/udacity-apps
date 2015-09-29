//
//  ViewController.swift
//  FlickFinder
//
//  Created by Rachel Schifano on 8/28/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit

// 1. Define constants
let BASE_URL = "https://api.flickr.com/services/rest/"
let METHOD_NAME = "flickr.galleries.getPhotos"
let API_KEY = "9da6823efae700d900b5d6c1a6d7703c"
let EXTRAS = "url_m"
let DATA_FORMAT = "json"
let NO_JSON_CALLBACK = "1"

class ViewController: UIViewController {

    @IBOutlet weak var searchedImageView: UIImageView!
    @IBOutlet weak var phraseTextField: UITextField!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeTextField: UITextField!
    @IBOutlet weak var imageTitleLabel: UILabel!
    
    @IBAction func searchPhotosByPhraseButtonTouchUp(sender: AnyObject) {
        // Hard-code search request
        // 2. API method arguments
        let methodArguments = [
            "method": METHOD_NAME,
            "api_key": API_KEY,
            "extras": EXTRAS,
            "data_format": DATA_FORMAT,
            "no_json_callback": NO_JSON_CALLBACK
        ]
        
        // 3. Call Flickr API
        getImageFromFlickrBySearch(methodArguments)
    }

    @IBAction func searchPhotosByLatLonButtonTouchUp(sender: AnyObject) {
    }
    
    func getImageFromFlickrBySearch(methodArguments: [String: AnyObject]) {
        // 4. Get shared NSURLSession to facilitate network activity
        let session = NSURLSession.sharedSession()
        
        // 5. Create the NSURLRequest using properly escaped URL
        let urlString = BASE_URL + escapedParameters(methodArguments)
        let url = NSURL(string: urlString)!
        let request = NSURLRequest(URL: url)
        
        // 6. Create NSURLSessionDataTask and completion handler
        let task = session.dataTaskWithRequest(request) { data, response, downloadError in
            if let error = downloadError {
                print("Could not complete the request \(error)")
            } else {
                let parsedResult = (try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)) as! NSDictionary
                print(parsedResult.valueForKey("photos")) // TEST
            }
        }
        // 7. Resume (execute) the task
        task.resume()
    }
    
    /* Helper function: Given a dictionary of parameters, convert to a string for a url */
    func escapedParameters(parameters: [String : AnyObject]) -> String {
        
        var urlVars = [String]()
        
        for (key, value) in parameters {
            
            /* Make sure that it is a string value */
            let stringValue = "\(value)"
            
            /* Escape it */
            let escapedValue = stringValue.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
            
            /* Append it */
            urlVars += [key + "=" + "\(escapedValue!)"]
            
        }
        
        return (!urlVars.isEmpty ? "?" : "") + urlVars.joinWithSeparator("&")
    }
}