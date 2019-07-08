//
//  Figure.Style.Components.swift
//  Figure
//
//  Created by Haider Khan on 7/6/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation
import Form

#if os(iOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif 

public protocol StyleComponent {
    static func style(backgroundColor: Color,
                      cornerRadius: Number,
                      opacity: Number,
                      borderColor: Color,
                      borderWidth: Number,
                      shadowRadius: Number,
                      shadowOpacity: Number,
                      shadowOffsetX: Number,
                      shadowOffsetY: Number,
                      shadowColor: Color,
                      contentMode: ContentMode,
                      clipsToBounds: Bool,
                      maskToBounds: Bool) -> Self
}

public struct StyleBuilder {
    public typealias ApplyStyles = (Style, UIView) -> ()
    public let style: Style
    public let applyStyles: ApplyStyles
    private init(style: Style,
                 applyStyles: @escaping ApplyStyles = StyleBuilder.defaultApplyStyles) {
        self.style = style
        self.applyStyles = applyStyles
    }
    
}

extension StyleBuilder: StyleComponent {
    public static func style(backgroundColor: Color = .clear,
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
                             maskToBounds: Bool = true) -> StyleBuilder {
        return StyleBuilder(
            style: Style(
                backgroundColor: backgroundColor,
                cornerRadius: cornerRadius,
                opacity: opacity,
                borderColor: borderColor,
                borderWidth: borderWidth,
                shadowRadius: shadowRadius,
                shadowOpacity: shadowOpacity,
                shadowOffsetX: shadowOffsetX,
                shadowOffsetY: shadowOffsetY,
                shadowColor: shadowColor,
                contentMode: contentMode,
                clipsToBounds: clipsToBounds,
                maskToBounds: maskToBounds
            )
        )
    }
}

extension StyleBuilder {
    static var defaultApplyStyles: ApplyStyles {
        return { style, view in
            
            #if os(iOS)
            view.backgroundColor = style.backgroundColor.uiColor
            #elseif os(OSX)
            view.wantsLayer = true
            view.layer?.backgroundColor = style.backgroundColor.uiColor.cgColor
            #endif
    
            #if os(iOS)
            view.layer.cornerRadius = style.cornerRadius.resolve.cgFloat
            #elseif os(OSX)
            view.wantsLayer = true
            view.layer?.cornerRadius = style.cornerRadius.resolve.cgFloat
            #endif

            #if os(iOS)
            view.alpha = style.opacity.resolve.cgFloat
            #elseif os(OSX)
            view.alphaValue = style.opacity.resolve.cgFloat
            #endif
    
            #if os(iOS)
            view.layer.borderColor = style.borderColor.uiColor.cgColor
            #elseif os(OSX)
            view.wantsLayer = true
            view.layer?.borderColor = style.borderColor.uiColor.cgColor
            #endif
    
            #if os(iOS)
            view.layer.borderWidth = style.borderWidth.resolve.cgFloat
            #elseif os(OSX)
            view.wantsLayer = true
            view.layer?.borderWidth = style.borderWidth.resolve.cgFloat
            #endif
    
            #if os(iOS)
            view.layer.shadowRadius = style.shadowRadius.resolve.cgFloat
            #elseif os(OSX)
            view.wantsLayer = true
            view.layer?.shadowRadius = style.shadowRadius.resolve.cgFloat
            #endif
    
            #if os(iOS)
            view.layer.shadowOpacity = style.shadowOpacity.resolve
            #elseif os(OSX)
            view.wantsLayer = true
            view.layer?.shadowOpacity = style.shadowOpacity.resolve
            #endif
    
            #if os(iOS)
            var original = view.layer.shadowOffset
            var new = CGSize(width: style.shadowOffsetX.resolve.cgFloat,
                             height: original.height)
            view.layer.shadowOffset = new
            #elseif os(OSX)
            var original = view.layer?.shadowOffset ?? .zero
            var new = CGSize(width: style.shadowOffsetX.resolve.cgFloat,
                             height: original.height)
            view.wantsLayer = true
            view.layer?.shadowOffset = new
            #endif
    
            #if os(iOS)
            original = view.layer.shadowOffset
            new = CGSize(width: original.width,
                         height: style.shadowOffsetY.resolve.cgFloat)
            view.layer.shadowOffset = new
            #elseif os(OSX)
            original = view.layer?.shadowOffset ?? .zero
            new = CGSize(width: original.width,
                         height: style.shadowOffsetY.resolve.cgFloat)
            view.wantsLayer = true
            view.layer?.shadowOffset = new
            #endif
    
            #if os(iOS)
            view.layer.shadowColor = style.shadowColor.uiColor.cgColor
            #elseif os(OSX)
            view.wantsLayer = true
            view.layer?.shadowColor = style.shadowColor.uiColor.cgColor
            #endif
    
            // Content Mode 
            #if os(iOS)
        
            #elseif os(OSX)
        
            #endif
    
            #if os(iOS)
            view.clipsToBounds = style.clipsToBounds
            #elseif os(OSX)
            // Figure out clipping
            #endif
    
            #if os(iOS)
            view.layer.masksToBounds = style.maskToBounds
            #elseif os(OSX)
            view.wantsLayer = true
            view.layer?.masksToBounds = style.maskToBounds
            #endif
        }
    }
}

extension StyleBuilder {
    public static var defaultStyle: StyleBuilder {
        return StyleBuilder(style: Style(),
                            applyStyles: StyleBuilder.defaultApplyStyles)
    }
}
