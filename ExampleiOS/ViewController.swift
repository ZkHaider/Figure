//
//  ViewController.swift
//  ExampleiOS
//
//  Created by Haider Khan on 5/11/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import UIKit
import FigureiOS
import FigureSerializable

class ViewController: RenderViewController {
    
    // MARK: - View
    
    override var rootView: iOSRenderer {
        return .view(config: [.backgroundColor(.red)],
                     layout: [.fill])
    }
    
    // MARK: - Init
    
    required init() {
        super.init()
    }
    
    // MARK: - Lifecycle 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Transform to JSON
        let viewJSON: String = self.rootView.describe.json
        print(viewJSON)
    }


}

extension ViewController {
    fileprivate func initialize() {
        
    }
}

