//
//  Figure.View.Builder.swift
//  Figure
//
//  Created by Haider Khan on 7/6/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation
import Form

public protocol ViewComponents {
    static func view(name: String,
                     interactionEnabled: Bool,
                     hidden: Bool,
                     style: StyleBuilder,
                     layout: LayoutBuilder,
                     _ children: Self...) -> Self
    static func label(text: String,
                      textColor: Color,
                      font: String,
                      fontSize: Number,
                      name: String,
                      interactionEnabled: Bool,
                      hidden: Bool,
                      style: StyleBuilder,
                      layout: LayoutBuilder,
                      _ children: Self...) -> Self
    static func image(with path: String,
                      name: String,
                      interactionEnabled: Bool,
                      hidden: Bool,
                      style: StyleBuilder,
                      layout: LayoutBuilder,
                      _ children: Self...) -> Self
}
