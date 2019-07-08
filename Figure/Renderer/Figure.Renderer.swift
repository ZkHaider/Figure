//
//  Figure.Renderer.swift
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


public protocol AnyRenderer {
    var render: (AnyView) -> UIView { get }
}

public struct Renderer<V: AnyView>: AnyRenderer {
    
    public typealias Descriptor = V
    public typealias RenderFunction = (V) -> UIView
    
    public let render: (AnyView) -> UIView
    
    public init(render: @escaping RenderFunction) {
        self.render = { anyDescriptor in
            guard
                let descriptor = anyDescriptor as? Descriptor
                else { return UIView(frame: .zero) }
            return render(descriptor)
        }
    }
    
}
