//
//  iOS.Components.swift
//  FigureiOS
//
//  Created by Haider Khan on 5/11/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation
import Figure

public protocol iOSViewComponents {
    static func view(of type: UIView.Type,
                     config: [ViewConfig],
                     layout: [LayoutConfig],
                     _ children: Self...) -> Self
}
