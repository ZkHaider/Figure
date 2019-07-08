//
//  View.Types.swift
//  FigureiOS
//
//  Created by Haider Khan on 5/12/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation
import Figure

/// Supported View Types for iOS
public enum iOSViews: AnyViewType {
    case view
    case button
    case label
    case blur
    case video
    case image
    case scroll
    case collection
    case custom(UIView.Type)
    case unknown(String)
}

extension iOSViews: Codable {
    
    private enum RawValues: String, Codable {
        case view
        case button
        case label
        case blur
        case video
        case image
        case scroll
        case collection
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let stringValue = try container.decode(String.self)
        
        guard
            let className = NSClassFromString(stringValue) as? UIView.Type
            else {
                if let rawValue = RawValues(rawValue: stringValue) {
                    switch rawValue {
                    case .view:
                        self = .view
                    case .button:
                        self = .button
                    case .label:
                        self = .label
                    case .blur:
                        self = .blur
                    case .video:
                        self = .video
                    case .image:
                        self = .image
                    case .scroll:
                        self = .scroll
                    case .collection:
                        self = .collection
                    }
                } else {
                    self = .unknown(stringValue)
                }
                return 
        }
        self = .custom(className)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .view:
            try container.encode(RawValues.view)
        case .button:
            try container.encode(RawValues.button)
        case .label:
            try container.encode(RawValues.label)
        case .blur:
            try container.encode(RawValues.blur)
        case .video:
            try container.encode(RawValues.video)
        case .image:
            try container.encode(RawValues.image)
        case .scroll:
            try container.encode(RawValues.scroll)
        case .collection:
            try container.encode(RawValues.collection)
        case .custom(let type):
            let name = NSStringFromClass(type)
            try container.encode(name)
        case .unknown(let value):
            try container.encode(value)
        }
    }
    
}
