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
    var json: String? { get }
}

extension ViewDescriptor: Serializable where Component: Codable {
    
    public var json: String? {
        let jsonEncoder = JSONEncoder()
        let base = self.base
        guard
            let data = try? jsonEncoder.encode(base),
            let jsonString = String(data: data, encoding: .utf8)
            else {
                return nil
        }
        return jsonString
    }
    
}
