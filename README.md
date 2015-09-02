# SwiftCommons
Simple helper swift extensions for easily development.

## Installation
Copy all the files from the SwiftCommons/Classes folder to your project.

## APIs

### Global functions
* `isEven(:Int) -> Bool`
* `isOdd(:Int) -> Bool`
* `ngt(:Int) -> Int`

### GCD functions
* `dispatchAfter(delay delay: Double, closure: () -> ())`
* `dispatchAsync(queue: GCDQueue, closure: () -> ())`
* `dispatchSync(queue: GCDQueue, closure: () -> ())`

```swift
dispatchAsync(.Default) {
    dispatchSync(.Main) {
        ...
    }
}
```

### Foundation extensions

#### Array
* `subscript(orNil index: Int) -> Element?`
* `inits() -> Array`
* `tail() -> Array`
* `take(:Int) -> Array`
* `drop(:Int) -> Array`
* `forEach(:Element -> ())`
* `reduce1(:(a: Element, b: Element) -> Element) -> Element`

#### String
* `* :Int -> String`
* `length: Int`
* `subscript(i: Int) -> String`
* `subscript(range: Range<Int>) -> String`
* `trim() -> String`
* `trimn() -> String`
* `split(separator: String) -> [String]`
* `urlEncode() -> String`
* `urlDecode() -> String`
* `toDate(format format: String) -> NSDate?`

### UIKit extensions

#### UIColor
* `fromHex(hex: String) -> UIColor?`

#### UIView
* operators
  * `+= CGPoint`
  * `-= CGPoint`
  * `+= CGSize`
  * `-= CGSize`
* properties
  * `x: CGFloat`
  * `y: CGFloat`
  * `width: CGFloat`
  * `height: CGFloat`
  * `right: CGFloat`
  * `bottom: CGFloat`
  * `position: CGPoint`
  * `size: CGSize`
* methods
  * `hide() -> UIView`
  * `show() -> UIView`
  * `findView(:(:UIView) -> Bool) -> UIView?`
  * `findViews(f: (view: UIView) -> Bool) -> [UIView]`
  * `applyAllSubviews(f: (view: UIView) -> ())`
  * `applyAllViews(f: (view: UIView) -> ())`

#### UIViewController
* `exclusiveTouches()`

## Requirements

Swift 2.0 / iOS 8.0+

## License

The MIT License. See LICENSE for details.

===========
[@tobi462](https://twitter.com/tobi462), August 2015.
