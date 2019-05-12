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

public struct iOSRenderer {
    
    public typealias Render = () -> (UIView)
    
    public let config: [ViewConfig]
    public let layout: [LayoutConfig]
    public let children: [iOSRenderer]
    internal let render: Render
    
    fileprivate init(config: [ViewConfig],
                     layout: [LayoutConfig],
                     children: [iOSRenderer],
                     render: @escaping Render) {
        self.config = config
        self.layout = layout
        self.children = children
        self.render = render
    }
    
}

extension iOSRenderer: ViewComponent {
    public static func view(config: [ViewConfig] = [],
                            layout: [LayoutConfig] = [],
                            _ children: iOSRenderer...) -> iOSRenderer {
        let render: Render = { () -> UIView in
            let view = UIView(frame: .zero)
            view.applyConfig(config)
            children.compactMap({ $0.render() })
                .forEach(view.addSubview)
            return view
        }
        return iOSRenderer(config: config,
                        layout: layout,
                        children: children,
                        render: render)
    }
}

extension iOSRenderer: iOSViewComponents {
    public static func view(of type: UIView.Type = UIView.self,
                            config: [ViewConfig] = [],
                            layout: [LayoutConfig] = [],
                            _ children: iOSRenderer...) -> iOSRenderer {
        let render: Render = { () -> UIView in
            let view = type.init(frame: .zero)
            view.applyConfig(config)
            children.compactMap({ $0.render() })
                .forEach(view.addSubview)
            return view
        }
        return iOSRenderer(config: config,
                           layout: layout,
                           children: children,
                           render: render)
    }
    
    
}

extension UIView {
    fileprivate func applyConfig(_ configs: [ViewConfig]) {
        for config in configs {
            switch config {
            case .backgroundColor(let color):
                self.backgroundColor = color
            }
        }
    }
}
