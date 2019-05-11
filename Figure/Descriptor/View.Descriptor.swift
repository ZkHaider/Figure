//
//  View.Descriptor.swift
//  Figure
//
//  Created by Haider Khan on 5/11/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation

public struct ViewDescriptor<Component> {
    public let base: Component
    public init(_ base: Component) {
        self.base = base
    }
}

public protocol DescriptorCompatible {
    associatedtype CompatibleType
    var describe: ViewDescriptor<CompatibleType> { get set }
}

extension DescriptorCompatible {
    public var describe: ViewDescriptor<Self> {
        // Do we need to box values inside this struct somehow for copy on writability
        // let boxed = Box<Self> -> boxed.unwrap ?
        get { return ViewDescriptor(self) }
        set { /* enables using descriptor to "mutate" base object */ }
    }
}
