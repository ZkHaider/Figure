

#  Figure
by Haider Khan

**Figure** is a elegant declarative UI library, utilizing the [Final Tagless](http://okmij.org/ftp/tagless-final/index.html) solution to the [expression problem](https://www.dotconferences.com/2018/01/brandon-kase-finally-solving-the-expression-problem).

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

Notice we declaratively create the view in `rootView` and then render it by calling `render()` in `loadView()`. Alternatively you can subclass your `UIViewController` with `RenderViewController` and override the `rootView` property. `RenderViewController` handles your view rendering automatically, so even less boilerplate to write. 

```swift 
import FigureiOS

final class ViewController: RenderViewController {

    // MARK: - View 

    override var rootView: iOSRenderer {
        return .view(config: [],
                     layout: [])
    }
    
}
```
Declare view hierarchies like so:

```swift 
let myNestedView: iOSRenderer = .view(
    config: [],
    layout: [.fill],
    .view(
        config: [],
        layout: [.set(width: 100.0, height: 100.0)],
        .view(config: [], layout: []),
        .view(config: [], layout: []),
        .view(layout: [], config: [])
    )
)

let view: UIView = myNestedView.render()
```

The above will create a root view with 1 subviews which itself should have 3 subviews.
