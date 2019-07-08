//
//  Figure.LayoutValue.swift
//  Figure
//
//  Created by Haider Khan on 7/7/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation
import Form

public enum LayoutValue {
    
    case setAbsolute(x: Number, y: Number, width: Number, height: Number)
    case setPercentage(x: Form.Dimension, y: Form.Dimension, width: Form.Dimension, height: Form.Dimension)
    
    // Centering
    case hCenter(startInset: Number,
                 endInset: Number)
    case vCenter(topInset: Number,
                 bottomInset: Number)
    case center
    
    // Fill
    case fill(inset: Number)
    case hFill(inset: Number)
    case vFill(inset: Number)
    
    case fillInset(inset: Inset)
    case hFillInset(startInset: Number,
                    endInset: Number)
    case vFillInset(topInset: Number,
                    bottomInser: Number)
}
