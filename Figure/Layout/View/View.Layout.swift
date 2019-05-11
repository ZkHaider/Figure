//
//  View.Layout.swift
//  Figure
//
//  Created by Haider Khan on 5/11/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation

public struct ViewLayout: LayoutInfo {
    public let frame: CGRect
    public init(frame: CGRect) {
        self.frame = frame 
    }
}
