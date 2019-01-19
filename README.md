# PKProgressView

[![CocoaPods](https://img.shields.io/cocoapods/p/FaveButton.svg)](https://github.com/bestiosdeveloper/PKProgressView)
[![codebeat badge](https://codebeat.co/badges/580517f8-efc8-4d20-89aa-900531610144)]()

A Swift based helper class that will provide a progress view that can be used to fill it with animation, also can be used for car animation.


![preview]()


## Requirements

- iOS 11.0+
- Xcode 10.0+

## Installation

For manual instalation, drag Source folder into your project.

or use [CocoaPod](https://cocoapods.org) adding this line to you `Podfile`:

```ruby
pod 'PKProgressView'
```

## Usage

### Initialization: 
`PKProgressView` can ne initated by code or can be assigned to `UIView` in Interface Builder

### By Code: 

Example:
```swift
let progressView = PKProgressView(frame: CGRect(x: 10.0, y: 20.0, width: 200.0, height: 5.0))
```

### By IB (Interface Builder): 

1) Just add and `UIView` on the `UIViewController`.
2) Assign the `PKProgressView` class to `UIView`.
3) Create an `IBOutlet` for the same view. 

Example:
```swift
@IBOutlet weak var progressView: PKProgressView!
```

### Set Progress

There are the following two way to set the progress:

#### With Animation: 

Example:

1) Just call `setProgress()` method from instance of `PKProgressView`.
2) Pass the `TimeInterval` in seconds in how much seconds you want to fill the progress.


```swift
progressView.setProgress(progress: 1.0, inSeconds: 10.0)
```

#### Without Animation: 

Example 1:

1) Just assign the progress value in `progress` property of `PKProgressView` instance.

```swift
progressView.progress = 0.3
```

Example 2:

1) Just call `setProgress()` method from instance of `PKProgressView`.
2) Pass the `TimeInterval` as `0.0`.

```swift
progressView.setProgress(progress: 1.0, inSeconds: 0.0)
```

## Configuration To Modify 

To make some modification you can use the following properties, Like:

1) `trackingImage` used to assign the tracking image, that will shown above the progress bar. Default: `nil` 

2) `trackingImageSize` used to give the size for the tracking image. Default: `CGSize(width: 25.0, height: 25.0)`

2) `trackTint` used to fill the background color of the progress view. Default: `UIColor.lightGray`

2) `progressTint` used to fill the progress of the progress view. Default: `UIColor.blue`

2) `trackBorderWidth` used to give the border for the progress view. Default: `0.0`

2) `progressBorderWidth` used to  give the border for progress of the progress view. Default: `0.0`

2) `trackBorderColor` used to give the border color for the progress view. Default: `UIColor.lightGray`

2) `progressBorderColor` used to  give the border color for progress of the progress view. Default: `UIColor.blue`

## Licence

PKCountryPicker is released under the MIT license.
