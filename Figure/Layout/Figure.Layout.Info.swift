//
//  Figure.Layout.swift
//  Figure
//
//  Created by Haider Khan on 7/7/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation
import Form

public protocol LayoutInfo {
    
    // Frame set
    static func set(x: Number, y: Number, width: Number, height: Number) -> Self
    static func set(xOffset: Form.Dimension,
                    yOffset: Form.Dimension,
                    widthPercent: Form.Dimension,
                    heightPercent: Form.Dimension) -> Self
    
    // Centering
    static func hCenter(startInset: Number,
                        endInset: Number) -> Self
    static func vCenter(topInset: Number,
                        bottomInset: Number) -> Self
    static func center() -> Self
    
    // Fill
    static func fill(inset: Number) -> Self
    static func hFill(inset: Number) -> Self
    static func vFill(inset: Number) -> Self
    
    static func fill(inset: Inset) -> Self
    static func hFill(startInset: Number,
                      endInset: Number) -> Self
    static func vFill(topInset: Number,
                      bottomInset: Number) -> Self

    
}
