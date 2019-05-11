//
//  View.Config.swift
//  Figure
//
//  Created by Haider Khan on 5/11/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation

#if os(OSX)
public typealias Color = NSColor
#else
public typealias Color = UIColor
#endif

public enum ViewConfig {
    case backgroundColor(Color)
}
