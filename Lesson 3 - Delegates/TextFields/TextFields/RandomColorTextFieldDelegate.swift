//
//  RandomColorTextFieldDelegate.swift
//  TextFields
//
//  Created by Rachel Schifano on 8/7/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit
import Foundation

class RandomColorTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        // Get the new text
        var newText: NSString = textField.text
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        textField.textColor = self.randomColor()
        
        return true
    }
    
    func randomColor() -> UIColor {
        
        // Approach 1: Create an array of colors then select one at random
        let colors = [UIColor.redColor(), UIColor.orangeColor(), UIColor.yellowColor(),
                      UIColor.greenColor(), UIColor.blueColor(), UIColor.purpleColor()]
        
        var colorChoice: Int = Int(arc4random() % UInt32(colors.count))
    
        // Approach 2: Generate random colors
//        let color = UIColor(red: 0.5, green: 0.2, blue: 0.9, alpha: 1)
        // Choose random colors
        
        // I thought I had to wrap UInt32 around the Int???
        // let randomIndex = Int(arc4random() % UInt32(colors.count)) difference???
        var hue: CGFloat = CGFloat(arc4random() % 256) / 256.0
        var saturation: CGFloat = CGFloat(arc4random() % 256) / 256.0 + 0.5
        var brightness: CGFloat = CGFloat(arc4random() % 256) / 256.0 + 0.5
        
//        var brightness: CGFloat = CGFloat(arc4random() % UInt32(256) / UInt32(256.0) + UInt32(0.5))
        var color = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
        println("Hue \(hue)") // TEST
        println(arc4random())
        return color
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}