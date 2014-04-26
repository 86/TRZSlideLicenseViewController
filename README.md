# TRZSlideLicenseViewController


**TRZSlideLicenseViewController is a iOS horizontal scroll view controller for displaying the licenses managed by Cocoapods.**

![TRZSlideLicenseViewController.gif](ghassets/TRZSlideLicenseViewController.gif)

## Requirements

iOS 7.0 or later

## Installation

[CocoaPods](http://cocoapods.org) is the recommended. Add the following line to your `Podfile`:

#### Podfile

```ruby
pod 'TRZSlideLicenseViewController'
```

## Usage

#### Stroyboard

1. Add a new view controller to your stroyboard.
2. Input ``TRZSlideLicenseViewController`` to custom class field in the identity inspector of the view controller.
3. Connected the view controller to a parent view controller.
4. Input a segue identifier in the attributes inspector of the segue settings.
5. Copy the ``Pods-acknowledgements.plist`` from the Pods directory to the project directory.
6. Implemented the ``prepareForSegue`` in the parent view controller class file.

```objective-c
#import "TRZSlideLicenseViewController.h"
```
```objective-c
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueIdentifier"]) {
        TRZSlideLicenseViewController *controller = segue.destinationViewController;
        controller.podsPlistName = @"Pods-acknowledgements.plist";
        controller.navigationItem.title = @"Sample Licenses";
    }
}

```

## License

MIT License



