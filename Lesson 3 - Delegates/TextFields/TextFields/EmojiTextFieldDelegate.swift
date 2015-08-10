//
//  EmojiTextFieldDelegate.swift
//  TextFields
//
//  Created by Rachel Schifano on 8/6/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit
import Foundation

class EmojiTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    // Declare new emoji dictionary
    var emojiTranslations = [String: String]()
    
    // Override the default initializer
    override init() {
        // When you override, you should really call super
        super.init()
        
        // Unicode values U+2708 = \u{2708}
        // Initialize the dictionary values
        emojiTranslations["heart"] = "\u{0001F496}"
        emojiTranslations["fish"] = "\u{E522}"
        emojiTranslations["bird"] = "\u{E523}"
        emojiTranslations["frog"] = "\u{E531}"
        emojiTranslations["bear"] = "\u{E527}"
        emojiTranslations["dog"] = "\u{E052}"
        emojiTranslations["cat"] = "\u{E04F}"
        emojiTranslations["plane"] = "\u{2708}"
    }
    
    // Emoji dictionary for corresponding unicode values
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        println("emoji delegate") // TEST
        
        // Get current text
        var newText: NSString = textField.text
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        var emojiStringRange: NSRange
        var replacedAnEmoji = false
        
        // Loop through the dictionary, checking each key-value pair
        for (emojiString, emojiUnicode) in emojiTranslations {
            // Search through the text string for emojiString and replace with the emojiUnicode
            do {
                // Find the range where there is an emoji string match
                emojiStringRange = newText.rangeOfString(emojiString, options: NSStringCompareOptions.CaseInsensitiveSearch)
                
                // Found a string match
                if emojiStringRange.location != NSNotFound {
                    newText = newText.stringByReplacingCharactersInRange(emojiStringRange, withString: emojiUnicode)
                    replacedAnEmoji = true
                }
            } while emojiStringRange.location != NSNotFound
        }
        // If there was a replacement, edit the text field with it
        // Otherwise, allow the text field to be edited
        if replacedAnEmoji {
            textField.text = newText as String
            return false
        } else {
            return true
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}