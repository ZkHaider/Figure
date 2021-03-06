//
//  Figure.View.swift
//  Figure
//
//  Created by Haider Khan on 7/6/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation

public struct View: AnyView {
    public let name: String
    public let type: AnyViewType
    public let subviews: [AnyViews]
    public let layout: [LayoutInfo]
    public let style: Style
    public let interactionEnabled: Bool
    public let hidden: Bool
    
    public init(name: String,
                type: AnyViewType,
                subviews: [AnyViews],
                layout: [LayoutInfo],
                style: Style,
                interactionEnabled: Bool,
                hidden: Bool) {
        self.name = name
        self.type = type
        self.subviews = subviews
        self.layout = layout
        self.style = style
        self.interactionEnabled = interactionEnabled
        self.hidden = hidden
    }
}
