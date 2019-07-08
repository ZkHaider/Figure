//
//  Color.swift
//  Figure
//
//  Created by Haider Khan on 7/6/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation
import CoreGraphics

#if os(iOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif


public enum Color {
    
    public typealias HexString = String
    
    case clear
    
    case black
    case blue
    case brown
    case cyan
    case darkGray
    case gray
    case green
    case lightGray
    case magenta
    case orange
    case purple
    case red
    case white
    case yellow
    
    case rgba(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
    case custom(HexString)
    
    var uiColor: UIColor {
        switch self {
        case .clear:
            return .clear
        case .black:
            return .black
        case .blue:
            return .blue
        case .brown:
            return .brown
        case .cyan:
            return .cyan
        case .darkGray:
            return .darkGray
        case .gray:
            return .gray
        case .green:
            return .green
        case .lightGray:
            return .lightGray
        case .magenta:
            return .magenta
        case .orange:
            return .orange
        case .purple:
            return .purple
        case .red:
            return .red
        case .white:
            return .white
        case .yellow:
            return .yellow
        case .rgba(let red, let green, let blue, let alpha):
            return UIColor(red: red, green: green, blue: blue, alpha: alpha)
        case .custom(let hexString):
            return UIColor(hexString: hexString)
        }
    }
    
}
