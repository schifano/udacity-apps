//
//  BlendColorTextFieldDelegate.swift
//  TextFields
//
//  Created by Rachel Schifano on 8/8/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit
import Foundation

class BlendColorTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    // Create a dictionary of color words
    let colors: [String: UIColor] = [
        "red": UIColor.redColor(),
        "orange": UIColor.orangeColor(),
        "yellow": UIColor.yellowColor(),
        "green": UIColor.greenColor(),
        "blue": UIColor.blueColor(),
        "purple": UIColor.purpleColor()
    ]
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        // Create array to store color matches
        var colorArray = [UIColor]()
        var colorStringRange: NSRange
        
        // Get the new text
        var newText: NSString = textField.text
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        // Search through text and find key color words and store it into an array
        for (colorKey, colorValue) in colors {
            if newText.rangeOfString(colorKey, options: NSStringCompareOptions.CaseInsensitiveSearch).location != NSNotFound {
                colorArray.append(colorValue)
            }
        }
        
        // Set the color of the current text field
        if colorArray.count != 0 {
            textField.textColor = blendColors(colorArray)
        }
        return true
    }
    
    func blendColors(colorArray: [UIColor]) -> UIColor {
        // Create an array that holds four values (RGBA) at default values 0.0
        // Create a color component array to store the new values of RGB
        var colorComponent = [CGFloat](count: 4, repeatedValue: 0.0)
        
        // Iterate through the array of colors? And somehow blend them? Maybe you can average them?
        for color in colorArray {
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0
            
            // Get the component value for each color retrieved
            color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            
            // Add all the color values
            colorComponent[0] += red
            colorComponent[1] += green
            colorComponent[2] += blue
            colorComponent[3] += alpha
        }
        
        // Divide each color component by the number of colors to blend them
        for i in 0...colorComponent.count-1 {
            colorComponent[i] /= CGFloat(colorArray.count)
        }
        
        // We know we want to return a color through UIColor
        return UIColor(red: colorComponent[0], green: colorComponent[1], blue: colorComponent[2], alpha: colorComponent[3])
    }
    
    // Allow user keyboard to return
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}