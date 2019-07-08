//
//  iOS.Descriptor.swift
//  FigureiOS
//
//  Created by Haider Khan on 5/11/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation
import Figure

extension iOSRenderer: DescriptorCompatible {}

extension ViewDescriptor: Renderable where Component == iOSRenderer {
    
    public var view: UIView {
        let viewDescription = self.base.descriptor
        return self.base.renderer.render(viewDescription)
    }
    
}
