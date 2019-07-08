//
//  Any.Custom.View.swift
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

public protocol AnyCustomView: AnyView {
    var customType: UIView.Type { get }
}
