//
//  Codable+Extensions.swift
//  Figure
//
//  Created by Haider Khan on 7/6/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation

extension KeyedDecodingContainerProtocol {
    
    public func decode<T: Decodable>(forKey key: Key) throws -> T {
        return try decode(T.self, forKey: key)
    }
    
    public func decode<T: Decodable>(
        forKey key: Key,
        default defaultExpression: @autoclosure () -> T) throws -> T {
        return try decodeIfPresent(T.self, forKey: key) ?? defaultExpression()
    }
    
}
