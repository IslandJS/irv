//
//  UIView+IRV.swift
//  IRV
//
//  Created by William Anderson on 12/8/16.
//  Copyright © 2016 Bill Anderson. All rights reserved.
//

import UIKit

extension UIView {
    
    func addShadow(cgcolor: CGColor = UIColor.darkGray.cgColor, offset: CGSize = CGSize(width: 0, height: 2), radius: CGFloat = 2.0, opacity: Float = 0.35, usePath: Bool = true) {
        
        // Add shadow ensuring roundy corners are respected
        layer.shadowColor = cgcolor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        
        // If the shadowPath is added it doesn't follow frame changes due to layout updates
        if usePath {
            layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
        }
        
    }
    
    func addOutline(cgcolor: CGColor = UIColor.white.cgColor, width: CGFloat = 1.0, cornerRadius: CGFloat = 8) {
        
        // Add border and roundyness
        layer.borderColor = cgcolor
        layer.borderWidth = width
        layer.cornerRadius = cornerRadius
        
        // Ensure roundy corners didn't befoul the shadow path
        if let cgcolor = layer.shadowColor {
            addShadow(cgcolor: cgcolor, offset: layer.shadowOffset, radius: layer.shadowRadius, opacity: layer.shadowOpacity)
        }
        
    }
    
}
