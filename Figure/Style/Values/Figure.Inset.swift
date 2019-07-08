//
//  Figure.Inset.swift
//  Figure
//
//  Created by Haider Khan on 7/6/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation
import Form

public struct Inset {
    public let left: Number
    public let top: Number
    public let right: Number
    public let bottom: Number
}

extension Inset: WithDefaultValue {
    
    public static var defaultValue: Inset {
        return .zero
    }
    
    public static var zero: Inset {
        return Inset(left: 0.0,
                     top: 0.0,
                     right: 0.0,
                     bottom: 0.0)
    }
    
}

extension Inset: Codable {
    
    private enum RootKeys: String, CodingKey {
        case left
        case top
        case right
        case bottom
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        self.left = try container.decode(Number.self, forKey: .left)
        self.top = try container.decode(Number.self, forKey: .top)
        self.right = try container.decode(Number.self, forKey: .right)
        self.bottom = try container.decode(Number.self, forKey: .bottom)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: RootKeys.self)
        try container.encode(self.left, forKey: .left)
        try container.encode(self.top, forKey: .top)
        try container.encode(self.right, forKey: .right)
        try container.encode(self.bottom, forKey: .bottom)
    }
    
}

extension Inset: ExpressibleByArrayLiteral {
    
    public typealias ArrayLiteralElement = Float
    
    public init(arrayLiteral elements: ArrayLiteralElement...) {
        guard
            elements.count == 4
            else {
                self.left = 0.0
                self.right = 0.0
                self.bottom = 0.0
                self.top = 0.0
                return
        }
        self.left = elements[0].isNaN ? .undefined : .defined(elements[0])
        self.top = elements[1].isNaN ? .undefined : .defined(elements[1])
        self.right = elements[2].isNaN ? .undefined : .defined(elements[2])
        self.bottom = elements[3].isNaN ? .undefined : .defined(elements[3])
    }
    
}
