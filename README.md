

#  Figure
### by Haider Khan

Elegant Declarative UI Library. 

## Usage 

A view is declared simply by:

```swift 
let view: iOSRenderer = .view(config: [], layout: [])
```

You can then render that view like so:

```swift 
let renderedView: UIView = view.render()
```

You can simply create a `var` in your `UIViewController` as your root view, like so:

```swift 
import FigureiOS

final class ViewController: UIViewController {

    // MARK: - View 

    var rootView: iOSRenderer {
        return .view(config: [],
                     layout: [])
    }
    
    // MARK: - Init
    
    // ...
    
    // MARK: - Lifecycle 
    
    override func loadView() {
        self.view = self.rootView.render()
    }

}
```

Notice we declaratively create the view in `rootView` and then render it by calling `render()` in `loadView()`.
