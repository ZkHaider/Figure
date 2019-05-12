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
public enum iOSViews {
    case view
    case custom(UIView.Type)
}

extension iOSViews: Codable {
    
    private enum RawValues: String, Codable {
        case view
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let stringValue = try container.decode(String.self)
        guard
            let className = NSClassFromString(stringValue) as? UIView.Type
            else {
                self = .view
                return 
        }
        self = .custom(className)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .view:
            try container.encode(RawValues.view)
        case .custom(let type):
            let name = NSStringFromClass(type)
            try container.encode(name)
        }
    }
    
}
