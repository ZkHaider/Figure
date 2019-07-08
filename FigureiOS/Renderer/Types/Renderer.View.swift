//
//  Renderer.View.swift
//  FigureiOS
//
//  Created by Haider Khan on 7/6/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation
import Figure

extension Renderer where V == View {
    static var view: Renderer<V> {
        return Renderer<V> { description -> UIView in
            return UIView(frame: .zero)
        }
    }
}
