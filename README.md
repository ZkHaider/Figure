

#  Figure

**Figure** is a elegant declarative UI library, utilizing the [Typed Tagless Final](http://okmij.org/ftp/tagless-final/index.html) solution to the [expression problem](https://www.dotconferences.com/2018/01/brandon-kase-finally-solving-the-expression-problem).

#### In Development: Not production ready.

## Installation 

### Carthage 

Add `github "ZkHaider/Figure" "master"` to your Cartfile, and run Carthage. 

### Requirements

- Deployment target iOS 10.0+
- Swift 4+
- Xcode 10+

## Usage 

#### Simple View Creation

A view is declared simply by:

```swift 
let view: iOSRenderer = .view()
```

You can then render that view like so:

```swift 
let renderedView: UIView = view.describe.view
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
        self.view = self.rootView.describe.view
    }

}
```

Notice we declaratively create the view in `rootView` and then render it by calling `rootView.describe.view` in `loadView()`. Alternatively you can subclass your `UIViewController` with `RenderViewController` and override the `rootView` property. `RenderViewController` handles your view rendering automatically, so even less boilerplate to write. 

```swift 
import FigureiOS

final class ViewController: RenderViewController {

    // MARK: - View 

    override var rootView: iOSRenderer {
        return .view()
    }
    
}
```

#### Nested View Creation

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

let view: UIView = myNestedView.describe.view
```

The above will create a root view which has a red background with 1 subview which has a width of 100.0 and a height of 100.0 which itself should have 3 subviews where 1 of those subviews fills the frame of it's parent view. 

<img src="https://github.com/ZkHaider/Figure/blob/master/Resources/view_hierarchy.png" />

#### Use your own Custom Views

Figure allows you to use your custom views in case you want more flexibility. Simply use them by:

```swift 
import FigureiOS

final class MyCustomView: UIView {}

let myCustomView: iOSRenderer = .view(of: MyCustomView.self)

let _myCustomView: UIView = myCustomView.describe.view

let myCustomNestedView: iOSRenderer = .view(
    of: MyCustomView.self,
    .view(
        .view(),
        .view(
            of: MyCustomView.self,
            config: [.backgroundColor(.red)]
        )
    )
)

let _myCustomNestedView: UIView = myCustomNestedView.describe.view
```

<img src="https://github.com/ZkHaider/Figure/blob/master/Resources/custom_view_hierarchy.png" />

## Composability 

This library adheres to be as composable as possible, meaning it should be easy for someone to:

- Add a new type
- Add a new interpretation or operation

This example is shown by the `FigureSerializable` module. We've implemented a new target and added new functionality to our `ViewDescriptor`. If someone wanted to now make our view hierarchy codable you can easily do so now via: 

```swift
import FigureSerializable

let view: iOSRenderer = .view()
guard 
    let json = view.describe.json
    else { return }
// use json...
```

Notice we are importing a new module `FigureSerializable`. Here is the rendered JSON:

<img src="https://github.com/ZkHaider/Figure/blob/master/Resources/view_json.png"  width="400" />

## Archiecture

<img src="https://github.com/ZkHaider/Figure/blob/master/Resources/figure_architecture.png" />

## Contributions

`Figure` welcomes both fixes, improvements, and feature additions. If you'd like to contribute, open a pull request with a detailed description of your changes. 

As a rule of thumb, if you're proposing an API breaking change or a change to existing functionality, consider proposing it by opening an issue, rather than a pull request; we'll use the issue as a public forum for discussing whether the proposal makes sense or not.

## Maintainers

Haider Khan
- https://github.com/ZkHaider

Timothy Kautz
- https://github.com/littleowl
