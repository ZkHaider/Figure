//
//  Figure.Any.Button.swift
//  Figure
//
//  Created by Haider Khan on 7/6/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation
import Form

public protocol AnyButton: AnyLabel, AnyImage {
    var titleInsets: Inset { get }
}
