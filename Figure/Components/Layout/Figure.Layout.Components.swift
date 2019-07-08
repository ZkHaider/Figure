//
//  Figure.Layout.Components.swift
//  Figure
//
//  Created by Haider Khan on 7/7/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation

#if os(iOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif


public protocol LayoutComponents {
    static func layout(_ layout: Layouter...) -> Self
}

public struct LayoutBuilder {
    public typealias ApplyLayout = ([Layouter], UIView) -> ()
    public let attributes: [Layouter]
    public let applyLayout: ApplyLayout
    private init(attributes: [Layouter],
                 applyLayout: @escaping ApplyLayout) {
        self.attributes = attributes
        self.applyLayout = applyLayout
    }
}

extension LayoutBuilder: LayoutComponents {
    public static func layout(_ layout: Layouter...) -> LayoutBuilder {
        return LayoutBuilder(attributes: Array(layout)) { attributes, view in
            for attribute in attributes {
                // FIXME: Apply Layout
            }
        }
    }
}

extension LayoutBuilder {
    public static var defaultLayout: LayoutBuilder {
        return LayoutBuilder(attributes: [.set(x: 0.0, y: 0.0, width: 0.0, height: 0.0)],
                             applyLayout: { _, _ in })
    }
}
