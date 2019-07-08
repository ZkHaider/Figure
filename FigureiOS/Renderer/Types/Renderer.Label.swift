//
//  Renderer.Label.swift
//  FigureiOS
//
//  Created by Haider Khan on 7/7/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation
import Figure

extension Renderer where V == Label {
    static var label: Renderer<V> {
        return Renderer<V> { description -> UIView in
            return UIView(frame: .zero)
        }
    }
}
