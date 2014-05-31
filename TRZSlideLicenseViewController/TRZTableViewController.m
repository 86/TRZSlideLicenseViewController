//
//  TRZTableViewController.m
//  TRZSlideLicenseViewController
//
//  Created by yam on 2014/05/31.
//  Copyright (c) 2014年 yam. All rights reserved.
//

#import "TRZTableViewController.h"
#import "TRZSlideLicenseViewController.h"

@interface TRZTableViewController ()

@end

@implementation TRZTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 4;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"default"]) {
        TRZSlideLicenseViewController *controller = segue.destinationViewController;
        controller.podsPlistName = @"Pods-acknowledgements.plist";
        controller.navigationItem.title = [self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]].textLabel.text;
        
    } else if ([segue.identifier isEqualToString:@"removeHeaderFooterPage"]) {
        TRZSlideLicenseViewController *controller = segue.destinationViewController;
        controller.podsPlistName = @"Pods-acknowledgements.plist";
        controller.navigationItem.title = [self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]].textLabel.text;

        // remove header and footer page
        controller.headerType = TRZSlideLicenseViewHeaderTypeNone;
        controller.footerType = TRZSlideLicenseViewFooterTypeNone;
        
    } else if ([segue.identifier isEqualToString:@"customizeHeaderFooterText"]) {
        TRZSlideLicenseViewController *controller = segue.destinationViewController;
        controller.podsPlistName = @"Pods-acknowledgements.plist";
        controller.navigationItem.title = [self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]].textLabel.text;
        
        // Cutomize header and footer text
        controller.headerType = TRZSlideLicenseViewHeaderTypeCustom;
        controller.headerTitle = @"Libraries We Use";
        controller.headerText = @"This application makes use of the third party libraries on the following page (➟).\n\nWe thank the open source community for all of their contributions.";

        controller.footerType = TRZSlideLicenseViewFooterTypeCustom;
        controller.footerTitle = @"Special Thanks";
        controller.footerText = @"These libraries are managed by CocoaPods (http://cocoapods.org).\n\nWe love CocoaPods and the contributors to the CocoaPods projects.";

    } else if ([segue.identifier isEqualToString:@"changeColors"]) {
        TRZSlideLicenseViewController *controller = segue.destinationViewController;
        controller.podsPlistName = @"Pods-acknowledgements.plist";
        controller.navigationItem.title = [self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]].textLabel.text;
        controller.headerType = TRZSlideLicenseViewHeaderTypeCustom;
        controller.headerTitle = @"Libraries We Use";
        controller.headerText = @"This application makes use of the third party libraries on the following page (➟).\n\nWe thank the open source community for all of their contributions.";
        controller.footerType = TRZSlideLicenseViewFooterTypeCustom;
        controller.footerTitle = @"Special Thanks";
        controller.footerText = @"These libraries are managed by CocoaPods (http://cocoapods.org).\n\nWe love CocoaPods and the contributors to the CocoaPods projects.";
        
        // Change colors
        controller.view.backgroundColor = [UIColor darkGrayColor];
        controller.view.tintColor = [UIColor colorWithRed:0.9 green:0.4 blue:0.4 alpha:1.0];
        controller.titleColor = [UIColor whiteColor];
        controller.textColor = [UIColor lightGrayColor];
    }
}


@end
