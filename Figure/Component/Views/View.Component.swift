//
//  View.Component.swift
//  Figure
//
//  Created by Haider Khan on 5/11/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation

public protocol ViewComponent {
    static func view(config: [ViewConfig],
                     layout: [LayoutConfig],
                     _ children: Self...) -> Self
}
