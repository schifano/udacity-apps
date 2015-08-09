//
//  ViewController.swift
//  TextFields
//
//  Created by Rachel Schifano on 8/6/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emojiTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var counterTextField: UITextField!
    @IBOutlet weak var characterCountLabel: UILabel!
    
    // Declare delegate objects
    let emojiDelegate = EmojiTextFieldDelegate()
    let randomColorDelegate = RandomColorDelegate()
    let blendColorDelegate = BlendColorDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Assign delegate objects to the text fields
        self.emojiTextField.delegate = emojiDelegate
//        self.colorTextField.delegate = randomColorDelegate
        self.colorTextField.delegate = blendColorDelegate
        self.counterTextField.delegate = self
    }

    // Delegate method shouldChangeCharactersInRange
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        // Retrieve the current text and update with the new text
        // Must be of type NSString to use stringByReplacingCharactersInRange
        var newText: NSString = textField.text
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        // Hide and show counter label
        characterCountLabel.hidden = (newText.length == 0)
        
        // Write length of new string into label
        characterCountLabel.text = String(newText.length)
        
        // Give textfield permission to update
        return true
    }
}