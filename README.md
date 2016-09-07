# SwiftPi

[![CI Status](http://img.shields.io/travis/sbaidon/SwiftPi.svg?style=flat)](https://travis-ci.org/sbaidon/SwiftPi)
[![Version](https://img.shields.io/cocoapods/v/SwiftPi.svg?style=flat)](http://cocoapods.org/pods/SwiftPi)
[![License](https://img.shields.io/cocoapods/l/SwiftPi.svg?style=flat)](http://cocoapods.org/pods/SwiftPi)
[![Platform](https://img.shields.io/cocoapods/p/SwiftPi.svg?style=flat)](http://cocoapods.org/pods/SwiftPi)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

Have WebIOPi running on your raspberry

Download: http://webiopi.trouch.com/

Documentation: http://webiopi.trouch.com/RESTAPI.html

How to run WebIOPi : sudo webiopi -d -c /etc/webiopi/config

WebIOPi-0.7.1 Patch for Raspberry B+, Pi2, and Pi3: https://github.com/doublebind/raspi


## Installation

SwiftPi is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SwiftPi"
```


## Options

Parameters should be of type GPIO, MODE or VALUE so errors can be avoided, enums provided can be seen below

### GPIO

```swift
  public enum GPIO : String{
        case ONE = "1"
        case TWO = "2"
        case THREE = "3"
        case FOUR = "4"
        case FIVE = "5"
        case SIX = "6"
        case SEVEN = "7"
        case EIGHT = "8"
        case NINE = "9"
        case TEN = "10"
        case ELEVEN = "11"
        case TWELVE = "12"
        case THIRTEEN = "13"
        case FOURTEEN = "14"
        case FIFTEEN = "15"
        case SIXTEEN = "16"
        case SEVENTEEN = "17"
        case EIGHTEEN = "18"
        case NINETEEN = "19"
        case TWENTY = "20"
        case TWENTYONE = "21"
        case TWENTYTWO = "22"
        case TWENTYTHREE = "23"
        case TWENTYFOUR = "24"
        case TWENTYFIVE = "25"
        case TWENTYSIX = "26"
        }
```

### Modes

```swift
    public enum MODE : String {
        case IN = "in"
        case OUT = "out"
        
    }
```

### Values

```swift
   public enum VALUE : String {
        case OFF = "0"
        case ON = "1"
        
    }
```

## How to use

```swift
var swiftPi = SwifPi(username: "username", password: "password", ip:"ip", port: "port")

var mode = swifPi.getMode(.ONE)

swiftPi.setMode(.ONE, .IN)

var value = swiftPi.getValue(.ONE)

swiftPi.setValue(.ONE, .ON)

//Asynchronous calls

swiftPi.getModeInBackground(.ONE){ (result) -> Void in
            if let res = result {
              //callback code       
        } }

swiftPi.getValueInBackround(.ONE){ (result) -> Void in
            if let res = result {
                //callback code
                
            }
        }
        
swiftPi.setValueInBackground(.ONE, .ON) { (result) -> Void in
            if let res = result {
                //callback code
            }
        }

swiftPi.setModeInBackground(.ONE, .IN) { (result) -> Void in
            if let res = result {
                //callback code
            }
        }
  
```

## Author

sbaidon, ardzoht, toniohdez43, PkBadger

## License

SwiftPi is available under the MIT license. See the LICENSE file for more info.
