# LilithProgressHUD

[![CI Status](http://img.shields.io/travis/joshuaarnold/LilithProgressHUD.svg?style=flat)](https://travis-ci.org/joshuaarnold/LilithProgressHUD)
[![Version](https://img.shields.io/cocoapods/v/LilithProgressHUD.svg?style=flat)](http://cocoapods.org/pods/LilithProgressHUD)
[![License](https://img.shields.io/cocoapods/l/LilithProgressHUD.svg?style=flat)](http://cocoapods.org/pods/LilithProgressHUD)
[![Platform](https://img.shields.io/cocoapods/p/LilithProgressHUD.svg?style=flat)](http://cocoapods.org/pods/LilithProgressHUD)

A beautiful, lightweight and elegant progress hud for iOS. 😎

![LilithProgressHUD Image](https://s4.postimg.org/4kd6bgtsd/Simulator_Screen_Shot_16_08_2016_8_06_52_AM.png)

## Installation

### CocoaPods

LilithProgressHUD is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "LilithProgressHUD"
```

### Manually 

1. Download and drop LilithProgressHUD.swift in your project.
2. Congratulations! 👏🏼

## Usage

It's easy as pie. 😋

```swift
//Import LilithProgressHUD
import LilithProgressHUD

//Show the HUD on a view
LilithProgressHUD.show(view)

... //Do something

//Hide all HUDs for the desired view
LilithProgressHUD.hide(view)
```

Sexy extras. 😘

```swift
//Set the opacity for the hud
LilithProgressHUD.opacity = 0.75

//Set the size of the hud
LilithProgressHUD.size = 50

//Set the corner radius of the hud
LilithProgressHUD.cornerRadius = 3
```

## License

LilithProgressHUD is available under the MIT license. See the LICENSE file for more info.
