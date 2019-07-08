//
//  Figure.Any.View.swift
//  Figure
//
//  Created by Haider Khan on 7/6/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation

public protocol AnyView {
    var name: String { get }
    var type: AnyViewType { get }
    var subviews: [AnyViews] { get }
    var layout: [LayoutInfo] { get }
    var style: Style { get }
    var interactionEnabled: Bool { get }
    var hidden: Bool { get }
}
