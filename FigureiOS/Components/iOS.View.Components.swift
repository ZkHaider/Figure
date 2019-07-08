//
//  iOS.Components.swift
//  FigureiOS
//
//  Created by Haider Khan on 5/11/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation
import Figure

public protocol iOSViewComponents: ViewComponents {
    static func customView(of type: UIView.Type,
                           name: String,
                           interactionEnabled: Bool,
                           hidden: Bool,
                           style: StyleBuilder,
                           layout: LayoutBuilder,
                           _ children: Self...) -> Self
}
