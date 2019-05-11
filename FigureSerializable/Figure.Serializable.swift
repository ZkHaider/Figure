//
//  Figure.Serializable.swift
//  FigureSerializable
//
//  Created by Haider Khan on 5/11/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation
import Figure

public protocol Serializable {
    var json: String { get }
}

extension ViewDescriptor: Serializable {
    
    public var json: String {
        return ""
    }
    
}

