//
//  Dimension+Extensions.swift
//  Figure
//
//  Created by Haider Khan on 7/7/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation
import Form
import ParsingKit

extension Form.Dimension: ExpressibleByFloatLiteral {

    public typealias FloatLiteralType = Float
    
    public init(floatLiteral value: FloatLiteralType) {
        if value.isNaN || value.isInfinite {
            self = .undefined
        } else {
            self = .points(value)
        }
    }

}

extension Form.Dimension: ExpressibleByStringLiteral {
    
    public typealias StringLiteralType = String
    
    public init(stringLiteral value: StringLiteralType) {
        
        // Try parsing percentage
        if let percentage = Parser.percentage.run(value).match {
            self = .percent(percentage)
        } else if let dimensionRaw = Dimension.RawValues(rawValue: value) {
            switch dimensionRaw {
            case .auto: self = .auto
            }
        } else {
            self = .undefined
        }
    }
    
}
