//
//  iOS.Renderer.Codable.swift
//  FigureiOS
//
//  Created by Haider Khan on 5/12/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation
import CoreGraphics
import Figure

extension LayoutConfig: Codable {

    private enum RootKeys: String, CodingKey {
        case type
        case value
    }
    
    private enum RawValues: String, Codable {
        case fill
        case horizontalFill
        case verticalFill
        case center
        case height
        case width
        case size
        case frame
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        let stringValue = try container.decode(String.self, forKey: .type)
        if let rawValue = RawValues(rawValue: stringValue) {
            switch rawValue {
            case .fill:
                self = .fill
            case .horizontalFill:
                self = .hFill
            case .verticalFill:
                self = .vFill
            case .center:
                self = .center
            case .height:
                let height = try container.decode(CGFloat.self, forKey: .value)
                self = .height(height)
            case .width:
                let width = try container.decode(CGFloat.self, forKey: .value)
                self = .width(width)
            case .size:
                let size = try container.decode(CGSize.self, forKey: .value)
                self = .set(width: size.width, height: size.height)
            case .frame:
                let rect = try container.decode(CGRect.self, forKey: .value)
                self = .frame(origin: rect.origin, size: rect.size)
            }
        } else {
            self = .frame(origin: .zero, size: .zero)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: RootKeys.self)
        switch self {
        case .fill:
            try container.encode(RawValues.fill, forKey: .type)
        case .hFill:
            try container.encode(RawValues.horizontalFill, forKey: .type)
        case .vFill:
            try container.encode(RawValues.verticalFill, forKey: .type)
        case .center:
            try container.encode(RawValues.center, forKey: .type)
        case .height(let height):
            try container.encode(RawValues.height, forKey: .type)
            try container.encode(height, forKey: .value)
        case .width(let width):
            try container.encode(RawValues.width, forKey: .type)
            try container.encode(width, forKey: .value)
        case .frame(let origin, let size):
            try container.encode(RawValues.frame, forKey: .type)
            let rect = CGRect(origin: origin, size: size)
            try container.encode(rect, forKey: .value)
        case .set(let width, let height):
            try container.encode(RawValues.size, forKey: .type)
            let size = CGSize(width: width, height: height)
            try container.encode(size, forKey: .value)
        }
    }

}
