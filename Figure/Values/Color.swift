//
//  ColorBox.swift
//  FigureiOS
//
//  Created by Haider Khan on 5/12/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation
import CoreGraphics

public struct Color: Codable {
    
    public let red: CGFloat
    public let green: CGFloat
    public let blue: CGFloat
    public let alpha: CGFloat
 
    public init(red: CGFloat,
                green: CGFloat,
                blue: CGFloat,
                alpha: CGFloat) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
    
}
