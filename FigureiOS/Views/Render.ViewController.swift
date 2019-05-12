//
//  Render.ViewController.swift
//  FigureiOS
//
//  Created by Haider Khan on 5/11/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import Foundation
import UIKit

open class BaseViewController: UIViewController {
    
    public required init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

public protocol HasRenderable {
    var rootView: iOSRenderer { get }
}

open class RenderViewController: BaseViewController {
    
    open var rootView: iOSRenderer {
        fatalError("fatalError: Must subclass")
    }
    
    open override func loadView() {
        self.view = rootView.describe.view
    }
    
}
