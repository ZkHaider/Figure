//
//  View.Style.swift
//  Figure
//
//  Created by Haider Khan on 7/6/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation
import Form

public enum ContentMode: String, Codable, Equatable {
    case scaleToFill
    case scaleAspectFill
    case scaleAspectFit
    case redraw
    // More to add
}

public struct Style {
        
    public let backgroundColor: Color
    public let cornerRadius: Number
    public let opacity: Number
    public let borderColor: Color
    public let borderWidth: Number
    public let shadowRadius: Number
    public let shadowOpacity: Number
    public let shadowOffsetX: Number
    public let shadowOffsetY: Number
    public let shadowColor: Color
    public let contentMode: ContentMode
    public let clipsToBounds: Bool
    public let maskToBounds: Bool
    
    init(backgroundColor: Color = .clear,
         cornerRadius: Number = 0.0,
         opacity: Number = 1.0,
         borderColor: Color = .clear,
         borderWidth: Number = 0.0,
         shadowRadius: Number = 0.0,
         shadowOpacity: Number = 0.0,
         shadowOffsetX: Number = 0.0,
         shadowOffsetY: Number = 0.0,
         shadowColor: Color = .clear,
         contentMode: ContentMode = .scaleToFill,
         clipsToBounds: Bool = true,
         maskToBounds: Bool = true) {
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.opacity = opacity
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.shadowRadius = shadowRadius
        self.shadowOpacity = shadowOpacity
        self.shadowOffsetX = shadowOffsetX
        self.shadowOffsetY = shadowOffsetY
        self.shadowColor = shadowColor
        self.contentMode = contentMode
        self.clipsToBounds = clipsToBounds
        self.maskToBounds = maskToBounds
    }
    
}
