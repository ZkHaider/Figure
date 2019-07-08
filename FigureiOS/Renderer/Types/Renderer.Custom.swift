//
//  Renderer.Custom.swift
//  FigureiOS
//
//  Created by Haider Khan on 7/7/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation
import Figure

extension Renderer where V == CustomView {
    static var custom: Renderer<V> {
        return Renderer<V> { description -> UIView in
            return UIView(frame: .zero)
        }
    }
}
