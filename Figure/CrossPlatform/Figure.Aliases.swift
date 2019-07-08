//
//  Aliases.swift
//  Figure
//
//  Created by Haider Khan on 5/12/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation

#if os(OSX)
import AppKit
public typealias UIColor = NSColor
public typealias UIView = NSView
public typealias UIFont = NSFont
#elseif os(iOS)
#endif
