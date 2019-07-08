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
        return .customView(
            of: MyCustomView.self,
            .view(
                layout: .layout(),
                .view(),
                .customView(
                    of: MyCustomView.self,
                    style: .style(
                        backgroundColor: .red
                    )
                )
            )
        )
    }
    
    // MARK: - Init
    
    required init() {
        super.init()
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        let view = self.rootView.describe.view
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Transform to JSON
//        guard
//            let viewJSON = self.rootView.describe.json
//            else { return }
//
//        print("""
//        🔎 Converted JSON:
//        \(viewJSON)\n
//        """)
//
//        // Revert back to Renderer
//        guard
//            let data = viewJSON.data(using: .utf8),
//            let renderer = try? JSONDecoder().decode(iOSRenderer.self, from: data)
//            else { return }
//
//        print("""
//        🔮 Converted Renderer:
//        \(renderer)
//        """)
//        let revertedView = renderer.describe.view
//        print(revertedView)
    }


}

extension ViewController {
    fileprivate func initialize() {
        
    }
}

final class MyCustomView: UIView {}
