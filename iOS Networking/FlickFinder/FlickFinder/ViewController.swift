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
    }
    
    @IBAction func searchPhotosByLatLonButtonTouchUp(sender: AnyObject) {
    }
}