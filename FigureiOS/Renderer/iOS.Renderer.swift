//
//  iOS.Renderer.swift
//  FigureiOS
//
//  Created by Haider Khan on 5/11/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation
import UIKit
import Figure
import Form

public struct iOSRenderer {    
    
    public typealias Render = () -> (UIView)
    
    public let descriptor: AnyView
    public let styles: StyleBuilder
    public let layout: LayoutBuilder
    public let children: [iOSRenderer]
    internal let renderer: AnyRenderer
    internal let viewType: iOSViews
    
    fileprivate init<T: AnyView>(descriptor: T,
                                 viewType: iOSViews,
                                 styles: StyleBuilder,
                                 layout: LayoutBuilder,
                                 children: [iOSRenderer],
                                 renderer: AnyRenderer) {
        self.descriptor = descriptor
        self.viewType = viewType
        self.styles = styles
        self.layout = layout
        self.children = children
        self.renderer = renderer
    }
    
}

extension iOSRenderer {
    static func subviews(from children: [iOSRenderer]) -> [AnyViews] {
        return children.compactMap({
            switch $0.descriptor {
            case let view as View:
                return Views.view(view)
            case let label as Label:
                return Views.label(label)
            case let image as Image:
                return Views.image(image)
            case let custom as CustomView:
                return Views.custom(custom)
            default:
                return Views.unknown("Type Not Known")
            }
        })
    }
}

extension iOSRenderer: ViewComponents {
    
    public static func view(name: String = "",
                            interactionEnabled: Bool = false,
                            hidden: Bool = false,
                            style: StyleBuilder = .defaultStyle,
                            layout: LayoutBuilder = .defaultLayout,
                            _ children: iOSRenderer...) -> iOSRenderer {
        
        let view = View(name: name,
                        type: Views.RawValues.view,
                        subviews: iOSRenderer.subviews(from: children),
                        layout: [],
                        style: style.style,
                        interactionEnabled: interactionEnabled,
                        hidden: hidden)
        
        return iOSRenderer(descriptor: view,
                           viewType: .view,
                           styles: style,
                           layout: layout,
                           children: children,
                           renderer: Renderer.view)
    }
    
    public static func label(text: String = "",
                             textColor: Color = .black,
                             font: String,
                             fontSize: Number,
                             name: String = "",
                             interactionEnabled: Bool = false,
                             hidden: Bool = false,
                             style: StyleBuilder = .defaultStyle,
                             layout: LayoutBuilder = .defaultLayout,
                            _ children: iOSRenderer...) -> iOSRenderer {
        
        let label = Label(name: name,
                          type: Views.RawValues.label,
                          text: text,
                          textColor: textColor,
                          font: font,
                          fontSize: fontSize,
                          subviews: iOSRenderer.subviews(from: children),
                          layout: [],
                          style: style.style,
                          interactionEnabled: interactionEnabled,
                          hidden: hidden)
        
        return iOSRenderer(descriptor: label,
                           viewType: .label,
                           styles: style,
                           layout: layout,
                           children: children,
                           renderer: Renderer.label)
    }
    
    public static func image(with path: String = "",
                             name: String = "",
                             interactionEnabled: Bool = false,
                             hidden: Bool = false,
                             style: StyleBuilder = .defaultStyle,
                             layout: LayoutBuilder = .defaultLayout,
                             _ children: iOSRenderer...) -> iOSRenderer {
        
        let image = Image(name: name,
                          type: Views.RawValues.image,
                          subviews: iOSRenderer.subviews(from: children),
                          layout: [],
                          style: style.style,
                          interactionEnabled: interactionEnabled,
                          hidden: hidden,
                          image: path)
        
        return iOSRenderer(descriptor: image,
                           viewType: .image,
                           styles: style,
                           layout: layout,
                           children: children,
                           renderer: Renderer.image)
    }
    
}

extension iOSRenderer: iOSViewComponents {
    public static func customView(of type: UIView.Type = UIView.self,
                                  name: String = "",
                                  interactionEnabled: Bool = false,
                                  hidden: Bool = false,
                                  style: StyleBuilder = .defaultStyle,
                                  layout: LayoutBuilder = .defaultLayout,
                                  _ children: iOSRenderer...) -> iOSRenderer {
        
        let custom = CustomView(customType: type,
                                name: name,
                                type: Views.RawValues.custom,
                                subviews: iOSRenderer.subviews(from: children),
                                layout: [],
                                style: style.style,
                                interactionEnabled: interactionEnabled,
                                hidden: hidden)
        
        return iOSRenderer(descriptor: custom,
                           viewType: .custom(type),
                           styles: style,
                           layout: layout,
                           children: children,
                           renderer: Renderer.custom)
    }
    
    
}
