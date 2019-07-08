//
//  Figure.Any.Label.swift
//  Figure
//
//  Created by Haider Khan on 7/6/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation
import Form

public protocol AnyLabel: AnyView {
    var text: String { get }
    var textColor: Color { get }
    var font: String { get }
    var fontSize: Number { get }
}
