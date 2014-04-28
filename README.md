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

#### Loadig a view from a Storyboard

1. Add a new view controller to your storyboard.
2. Input ``TRZSlideLicenseViewController`` to custom class field in the identity inspector of the view controller.
3. Make a push segue connection from a source view controller in the navigation controller’s stack to the ``TRZSlideLicenseViewController``.
4. Input a segue identifier in the attributes inspector of the segue settings.
5. Copy the ``Pods-acknowledgements.plist`` from the Pods directory to the project directory.
6. Implemented the ``prepareForSegue`` in the source view controller class file.

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

#### Creating a View Programmatically

1. Copy the ``Pods-acknowledgements.plist`` from the Pods directory to the project directory.
2. Implemented to a source view controller in the navigation controller’s stack as follows.

```objective-c
#import "TRZSlideLicenseViewController.h"
```

```objective-c
TRZSlideLicenseViewController *controller = [[TRZSlideLicenseViewController alloc] init];
controller.podsPlistName = @"Pods-acknowledgements.plist";
controller.navigationItem.title = @"Sample Licenses";
[self.navigationController pushViewController:controller animated:YES];
```

## License

MIT License



