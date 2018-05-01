//
//  UIColor+Util.swift
//  Daisytank
//
//  Created by Zhu Shengqi on 15/01/2018.
//  Copyright © 2018 daisytank. All rights reserved.
//


import UIKit

extension UIColor {
    
    public convenience init(rgb rgbValue: UInt, alpha: CGFloat = 1) {
        let red = CGFloat((rgbValue >> 16) & 0xFF) / 255.0
        let green = CGFloat((rgbValue >> 8) & 0xFF) / 255.0
        let blue = CGFloat(rgbValue & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}
