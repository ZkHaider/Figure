//
//  Figure.Layouter.swift
//  Figure
//
//  Created by Haider Khan on 7/7/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation
import Form

public struct Layouter {
    public let value: LayoutValue
}

extension Layouter: LayoutInfo {
    
    public static func set(x: Number = 0.0,
                           y: Number = 0.0,
                           width: Number = 0.0,
                           height: Number = 0.0) -> Layouter {
        return Layouter(value: .setAbsolute(x: x,
                                            y: y,
                                            width: width,
                                            height: height))
    }
    
    public static func set(xOffset: Form.Dimension = 0.0,
                           yOffset: Form.Dimension = 0.0,
                           widthPercent: Form.Dimension = 0.0,
                           heightPercent: Form.Dimension = 0.0) -> Layouter {
        return Layouter(value: .setPercentage(x: xOffset,
                                              y: yOffset,
                                              width: widthPercent,
                                              height: heightPercent))
    }
    
    public static func hCenter(startInset: Number = 0.0,
                               endInset: Number = 0.0) -> Layouter {
        return Layouter(value: .hCenter(startInset: startInset,
                                        endInset: endInset))
    }
    
    public static func vCenter(topInset: Number = 0.0,
                               bottomInset: Number = 0.0) -> Layouter {
        return Layouter(value: .vCenter(topInset: topInset,
                                        bottomInset: bottomInset))
    }
    
    public static func center() -> Layouter {
        return Layouter(value: .center)
    }
    
    public static func fill(inset: Number = 0.0) -> Layouter {
        return Layouter(value: .fill(inset: inset))
    }
    
    public static func hFill(inset: Number = 0.0) -> Layouter {
        return Layouter(value: .hFill(inset: inset))
    }
    
    public static func vFill(inset: Number) -> Layouter {
        return Layouter(value: .vFill(inset: inset))
    }
    
    public static func fill(inset: Inset) -> Layouter {
        return Layouter(value: .fillInset(inset: inset))
    }
    
    public static func hFill(startInset: Number, endInset: Number) -> Layouter {
        return Layouter(value: .hFillInset(startInset: startInset,
                                           endInset: endInset))
    }
    
    public static func vFill(topInset: Number, bottomInset: Number) -> Layouter {
        return Layouter(value: .vFillInset(topInset: topInset,
                                           bottomInser: bottomInset))
    }
    
    
    
    
}
