//
//  Figure.Custom.View.swift
//  Figure
//
//  Created by Haider Khan on 7/7/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation

#if os(iOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif

public struct CustomView: AnyCustomView {
    public let customType: UIView.Type
    public let name: String
    public let type: AnyViewType
    public let subviews: [AnyViews]
    public let layout: [LayoutInfo]
    public let style: Style
    public let interactionEnabled: Bool
    public let hidden: Bool
    
    public init(customType: UIView.Type,
                name: String,
                type: AnyViewType,
                subviews: [AnyViews],
                layout: [LayoutInfo],
                style: Style,
                interactionEnabled: Bool,
                hidden: Bool) {
        self.customType = customType
        self.name = name
        self.type = type
        self.subviews = subviews
        self.layout = layout
        self.style = style
        self.interactionEnabled = interactionEnabled
        self.hidden = hidden
    }
}
