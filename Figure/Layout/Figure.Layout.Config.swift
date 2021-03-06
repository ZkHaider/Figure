//
//  Layout.Config.swift
//  Figure
//
//  Created by Haider Khan on 5/11/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation
import CoreGraphics

public enum LayoutConfig {
    case fill
    case hFill
    case vFill
    case center
    case height(CGFloat)
    case width(CGFloat)
    case set(width: CGFloat, height: CGFloat)
    case frame(origin: CGPoint, size: CGSize)
}
