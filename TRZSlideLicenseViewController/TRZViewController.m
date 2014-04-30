//
//  TRZViewController.m
//  TRZSlideLicenseViewController
//
//  Created by yam on 2014/04/18.
//  Copyright (c) 2014年 yam. All rights reserved.
//

#import "TRZViewController.h"
#import "TRZSlideLicenseViewController.h"

@interface TRZViewController ()

@end

@implementation TRZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"pushLicenseView"]) {
        NSLog(@"prepareForSegue");
        TRZSlideLicenseViewController *controller = segue.destinationViewController;
        controller.podsPlistName = @"Pods-acknowledgements.plist";
        controller.navigationItem.title = @"Sample Licenses";
        controller.headerType = TRZSlideLicenseViewHeaderTypeCustom;
        controller.headerTitle = @"Libraries We Use";
        controller.headerText = @"This application makes use of the third party libraries on the following page (➟).\n\nWe thank the open source community for all of their contributions.";
        controller.footerType = TRZSlideLicenseViewFooterTypeNone;
    }
}

@end
