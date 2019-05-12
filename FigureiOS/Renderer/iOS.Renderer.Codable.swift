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

extension ViewConfig: Codable {

    private enum RootKeys: String, CodingKey {
        case type
        case value
    }

    private enum RawValues: String, Codable {
        case backgroundColor
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        let stringValue = try container.decode(String.self, forKey: .type)
        if let rawValue = RawValues(rawValue: stringValue) {
            switch rawValue {
            case .backgroundColor:
                let value = try container.decode(Color.self, forKey: .value)
                let uiColor = UIColor(red: value.red,
                                      green: value.green,
                                      blue: value.blue,
                                      alpha: value.alpha)
                self = .backgroundColor(uiColor)
            }
        } else {
            self = .backgroundColor(.clear)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: RootKeys.self)
        switch self {
        case .backgroundColor(let uiColor):
            try container.encode(RawValues.backgroundColor, forKey: .type)
            var red: CGFloat = 0.0
            var green: CGFloat = 0.0
            var blue: CGFloat = 0.0
            var alpha: CGFloat = 0.0
            uiColor.getRed(&red,
                           green: &green,
                           blue: &blue,
                           alpha: &alpha)
            let color = Color(red: red,
                              green: green,
                              blue: blue,
                              alpha: alpha)
            try container.encode(color, forKey: .value)
        }
    }

}

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

extension iOSRenderer: Codable {

    private enum RootKeys: String, CodingKey {
        case type
        case configs
        case layout
        case children
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        
        self.viewType = try container.decode(iOSViews.self, forKey: .type)
    
        if let config = try container.decodeIfPresent([ViewConfig].self, forKey: .configs) {
            self.config = config
        } else {
            self.config = []
        }
        
        if let layout = try container.decodeIfPresent([LayoutConfig].self, forKey: .layout) {
            self.layout = layout
        } else {
            self.layout = []
        }
        
        if let children = try container.decodeIfPresent([iOSRenderer].self, forKey: .children) {
            self.children = children
        } else {
            self.children = []
        }

        //        let render: Render = { () -> UIView in
        //            let view = UIView(frame: .zero)
        //            view.applyConfig(config)
        //            children.compactMap({ $0.render() })
        //                .forEach(view.addSubview)
        //            return view
        //        }
        self.render = { () -> UIView in return UIView(frame: .zero) }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: RootKeys.self)
        try container.encode(self.viewType, forKey: .type)
        
        if self.config.count > 0 {
            try container.encode(self.config, forKey: .configs)
        }
        if self.layout.count > 0 {
            try container.encode(self.layout, forKey: .layout)
        }
        if self.children.count > 0 {
            try container.encode(self.children, forKey: .children)
        }
    }

}
