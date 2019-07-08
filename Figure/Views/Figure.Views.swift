//
//  Views.swift
//  Figure
//
//  Created by Haider Khan on 7/6/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation

#if os(iOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif


/// Associated with the AnyViews protocol
public protocol AnyViewType {}

/// Usually an enum or a value type describing the value types to render into your view
public protocol AnyViews {
    var type: AnyViewType { get }
}

public enum Views: AnyViews {
        
    public enum RawValues: String, Codable, AnyViewType {
        case view
        case button
        case label
        case blur
        case video
        case image
        case scroll
        case collection
        case custom
        case unknown
    }
    
    case view(View)
    case button(Button)
    case label(Label)
    case blur
    case video
    case image(Image)
    case scroll
    case collection
    case custom(CustomView)
    case unknown(String)
    
    public var type: AnyViewType {
        switch self {
        case .view:
            return RawValues.view
        case .button:
            return RawValues.button
        case .label:
            return RawValues.label
        case .blur:
            return RawValues.blur
        case .video:
            return RawValues.video
        case .image:
            return RawValues.image
        case .scroll:
            return RawValues.scroll
        case .collection:
            return RawValues.collection
        case .custom:
            return RawValues.custom
        case .unknown:
            return RawValues.unknown
        }
    }
}
