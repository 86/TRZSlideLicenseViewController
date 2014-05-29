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
@property (nonatomic) NSArray *licenseViews;

@end


@implementation TRZSlideLicenseScrollView

- (id)initWithFrame:(CGRect)frame licenses:(NSArray*)licenses {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _licenses = licenses;
        [self initScrollView];
    }
    return self;
}

- (void)initScrollView {
    self.pagingEnabled = YES;
    self.alwaysBounceVertical = NO;
    self.alwaysBounceHorizontal = YES;
    self.directionalLockEnabled = YES;
    self.bouncesZoom = NO;
    self.contentSize = CGSizeMake(_licenses.count * self.frame.size.width, self.frame.size.height - 64);
    NSMutableArray *licenseViews = [NSMutableArray array];
    for (int i = 0; i < _licenses.count; i++) {
        CGRect frame = CGRectMake(self.frame.size.width * i, 0, self.frame.size.width, self.frame.size.height - 64);
        TRZLicenseView *licenseView = [[TRZLicenseView alloc] initWithFrame:frame];
        licenseView.libTitle.text = _licenses[i][@"Title"];
        [licenseView.libTitle sizeToFit];
        licenseView.libText.text = _licenses[i][@"FooterText"];
        NSString *page = [NSString stringWithFormat:@"%d/%lu",i + 1, (unsigned long)_licenses.count];
        licenseView.curPage.text = page;
        [self addSubview:licenseView];
        [licenseViews addObject:licenseView];
    }
    self.licenseViews = licenseViews;
}


#pragma mark - Setter

- (void)setTitleColor:(UIColor *)color
{
    if (color != _titleColor) {
        _titleColor = color;
        
        // Update the color of all
        for (TRZLicenseView *licenseView in self.licenseViews) {
            licenseView.libTitle.textColor = _titleColor;
        }
    }
}

- (void)setTextColor:(UIColor *)color
{
    if (color != _textColor) {
        _textColor = color;
        
        // Update the color of all
        for (TRZLicenseView *licenseView in self.licenseViews) {
            licenseView.libText.textColor = _textColor;
            licenseView.curPage.textColor = _textColor;
        }
    }
}

@end
