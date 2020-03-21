# SASBanner

[![CI Status](https://img.shields.io/travis/AnupSukumaran/SASBanner.svg?style=flat)](https://travis-ci.org/AnupSukumaran/SASBanner)
[![Version](https://img.shields.io/cocoapods/v/SASBanner.svg?style=flat)](https://cocoapods.org/pods/SASBanner)
[![License](https://img.shields.io/cocoapods/l/SASBanner.svg?style=flat)](https://cocoapods.org/pods/SASBanner)
[![Platform](https://img.shields.io/cocoapods/p/SASBanner.svg?style=flat)](https://cocoapods.org/pods/SASBanner)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

SASBanner is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SASBanner'
```
## Steps to integrate 

1) First put a view at the view controller like a banner and  assign  the view with class "ScrollViewBlock" with  "SASBanner" as Module.

2) Import BannerWork at the ViewController Class

2) Make a IBOutlet connection with the ViewController like this. 
        Eg:- "@IBOutlet weak var bannerView: ScrollViewBlock!"
        
3) Assign Images to the banner to scroll horizontally where every necessary. Like at the ViewDidLoad 
Eg:-  "bannerView.images = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3")]"

4) FOR AUTOMATIC SCROLL - > call the "manualScrollingAction()" at the action of button
Eg: - "bannerView.manualScrollingAction()"
        

---------------------------------That's all Folks---------------------------------------------------------------------
## Author

AnupSukumaran, anup.sukumaran9@gmail.com

## License

SASBanner is available under the MIT license. See the LICENSE file for more info.
