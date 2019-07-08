//
//  Figure.Label.swift
//  Figure
//
//  Created by Haider Khan on 7/6/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation
import Form

public struct Label: AnyLabel {
    public let name: String
    public let type: AnyViewType
    public let subviews: [AnyViews]
    public let layout: [LayoutInfo]
    public let style: Style
    public let text: String
    public let textColor: Color
    public let font: String
    public let fontSize: Number
    public let interactionEnabled: Bool
    public let hidden: Bool
    
    public init(name: String,
                type: AnyViewType,
                text: String,
                textColor: Color,
                font: String,
                fontSize: Number,
                subviews: [AnyViews],
                layout: [LayoutInfo],
                style: Style,
                interactionEnabled: Bool,
                hidden: Bool) {
        self.name = name
        self.type = type
        self.text = text
        self.textColor = textColor
        self.font = font
        self.fontSize = fontSize
        self.subviews = subviews
        self.layout = layout
        self.style = style
        self.interactionEnabled = interactionEnabled
        self.hidden = hidden
    }
    
}
