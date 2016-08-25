# SwiftPi

[![CI Status](http://img.shields.io/travis/sbaidon/SwiftPi.svg?style=flat)](https://travis-ci.org/sbaidon/SwiftPi)
[![Version](https://img.shields.io/cocoapods/v/SwiftPi.svg?style=flat)](http://cocoapods.org/pods/SwiftPi)
[![License](https://img.shields.io/cocoapods/l/SwiftPi.svg?style=flat)](http://cocoapods.org/pods/SwiftPi)
[![Platform](https://img.shields.io/cocoapods/p/SwiftPi.svg?style=flat)](http://cocoapods.org/pods/SwiftPi)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

Have WebIOPi running on your raspberry

Download:
http://webiopi.trouch.com/

sudo webiopi -d -c /etc/webiopi/config


## Installation

SwiftPi is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SwiftPi"
```

## How to use

```swift
var swiftPi = SwifPi(username: "username", password: "password", ip:"ip", port: "port")

var mode = swifPi.getMode(.ONE)

swiftPi.setMode(.ONE, .IN)

var value = swiftPi.getValue(.ONE)

swiftPi.setValue(.ONE, .ON)

  
```

## Author

sbaidon, ardzoht, toniohdez43, PkBadger

## License

SwiftPi is available under the MIT license. See the LICENSE file for more info.
