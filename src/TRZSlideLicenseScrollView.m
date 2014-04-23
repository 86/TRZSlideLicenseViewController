//
//  TRZSlideLicenseScrollView.m
//  TRZSlideLicenseViewController
//
//  Created by yam on 2014/04/18.
//  Copyright (c) 2014年 yam. All rights reserved.
//

#import "TRZSlideLicenseScrollView.h"
#import "TRZLicenseView.h"

@interface TRZSlideLicenseScrollView ()

@property (nonatomic) NSArray *licenses;

@end


@implementation TRZSlideLicenseScrollView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initScrollView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame licenses:(NSArray*)licenses {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _licenses = licenses;
        [self initScrollView];
    }
    return self;
}

- (void)awakeFromNib {
//    NSLog(@"awakeFromNib");
    [self initScrollView];
}

- (void)initScrollView {
    if (!_licenses) {
        [self loadLicensesWithPodsPlistName:@"Pods-acknowledgements.plist"];
    }
    self.pagingEnabled = YES;
    self.alwaysBounceVertical = YES;
    self.alwaysBounceHorizontal = YES;
    self.directionalLockEnabled = YES;
    self.bouncesZoom = NO;
    self.contentSize = CGSizeMake(_licenses.count * self.frame.size.width, self.frame.size.height);
    for (int i = 0; i < _licenses.count; i++) {
        CGRect frame = CGRectMake(self.frame.size.width * i, 0, self.frame.size.width, self.frame.size.height);
        TRZLicenseView *licenseView = [[TRZLicenseView alloc] initWithFrame:frame];
        licenseView.libTitle.text = _licenses[i][@"Title"];
        licenseView.libText.text = _licenses[i][@"FooterText"];
        [self addSubview:licenseView];
    }
}

- (void)loadLicensesWithPodsPlistName:(NSString *)podsPlistName {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:podsPlistName ofType:nil];
    NSData *plistData = [NSData dataWithContentsOfFile:filePath];
    NSPropertyListFormat format = NSPropertyListXMLFormat_v1_0;
    NSError *error;
    id dict = [NSPropertyListSerialization propertyListWithData:plistData options:(NSPropertyListReadOptions)NSPropertyListImmutable format:&format error:&error];
    if (!dict) {
        return;
    }
    NSMutableArray *preferenceSpecifiers = [NSMutableArray arrayWithArray:dict[@"PreferenceSpecifiers"]];
    [preferenceSpecifiers removeObjectAtIndex:0];
    [preferenceSpecifiers removeLastObject];
    _licenses = preferenceSpecifiers;
//    for (NSDictionary *license in _licenses) {
//        NSLog(@"Title:%@", license[@"Title"]);
//        NSLog(@"FooterText:%@", license[@"FooterText"]);
//    }
}

@end
