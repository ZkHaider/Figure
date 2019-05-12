

#  Figure

**Figure** is a elegant declarative UI library, utilizing the [Final Tagless](http://okmij.org/ftp/tagless-final/index.html) solution to the [expression problem](https://www.dotconferences.com/2018/01/brandon-kase-finally-solving-the-expression-problem).

## Installation 

### Carthage 

Add `github "ZkHaider/Figure" "master"` to your Cartfile, and run Carthage. 

### Requirements

- Deployment target iOS 10.0+
- Swift 4+
- Xcode 10+

## Usage 

A view is declared simply by:

```swift 
let view: iOSRenderer = .view()
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
        return .view()
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
        return .view()
    }
    
}
```
Declare view hierarchies like so:

```swift 
let myNestedView: iOSRenderer = .view(
    config: [.backgroundColor(.red)],
    .view(
        layout: [.set(width: 100.0, height: 100.0)],
        .view(layout: [.fill]),
        .view(),
        .view()
    )
)

let view: UIView = myNestedView.render()
```

The above will create a root view which has a red background with 1 subview which has a width of 100.0 and a height of 100.0 which itself should have 3 subviews where 1 of those subviews fills the frame of it's parent view. 

<img src="https://raw.githubusercontent.com/ZkHaider/Figure/master/Resources/view_hierarchy.png?sanitize=true&raw=true" />

## Composability 

This library adheres to be as composable as possible, meaning it should be easy for someone to:

- Add a new type
- Add a new interpretation or operation

This example is shown by the `FigureSerializable` module. We've implemented a new target and added new functionality to our `ViewDescriptor`. If someone wanted to now make our view hierarchy codable you can easily do so now via: 

```swift
import FigureSerializable

let view: iOSRenderer = .view()
let json: String = view.describe.json
```

Notice I am importing a new module `FigureSerializable`.

## Contributions

`Figure` welcomes both fixes, improvements, and feature additions. If you'd like to contribute, open a pull request with a detailed description of your changes. 

As a rule of thumb, if you're proposing an API breaking change or a change to existing functionality, consider proposing it by opening an issue, rather than a pull request; we'll use the issue as a public forum for discussing whether the proposal makes sense or not.

## Maintainers

Haider Khan
- https://github.com/ZkHaider

Timothy Kautz
- https://github.com/littleowl
