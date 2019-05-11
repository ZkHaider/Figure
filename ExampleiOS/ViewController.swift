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

class ViewController: UIViewController {
    
    // MARK: - View
    
    var rootView: iOSRenderer {
        return .view(config: [.backgroundColor(.red)],
                     layout: [.fill])
    }
    
    // MARK: - Init
    
    required init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = self.rootView.render()
    }

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

