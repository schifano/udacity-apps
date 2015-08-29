//
//  ViewController.swift
//  FlickFinder
//
//  Created by Rachel Schifano on 8/28/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit

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