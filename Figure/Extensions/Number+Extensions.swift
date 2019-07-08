//
//  Number+Extensions.swift
//  Figure
//
//  Created by Haider Khan on 7/6/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation
import Form

extension Number: ExpressibleByFloatLiteral {
    
    public typealias FloatLiteralType = Float
    
    public init(floatLiteral value: FloatLiteralType) {
        if value.isNaN || value.isInfinite {
            self = .undefined
        } else {
            self = .defined(value)
        }
    }
    
}
