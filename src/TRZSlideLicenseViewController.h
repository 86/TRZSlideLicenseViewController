//
//  TRZSlideLicenseViewController2.h
//  TRZSlideLicenseViewController
//
//  Created by yam on 2014/04/23.
//  Copyright (c) 2014年 yam. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TRZSlideLicenseViewHeaderType) {
    TRZSlideLicenseViewHeaderTypeDefault = 0,
    TRZSlideLicenseViewHeaderTypeNone,
    TRZSlideLicenseViewHeaderTypeCustom,
};

typedef NS_ENUM(NSUInteger, TRZSlideLicenseViewFooterType) {
    TRZSlideLicenseViewFooterTypeDefault = 0,
    TRZSlideLicenseViewFooterTypeNone,
    TRZSlideLicenseViewFooterTypeCustom,
};

@interface TRZSlideLicenseViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic) NSString *podsPlistName;

@property (nonatomic) TRZSlideLicenseViewHeaderType headerType;
@property (nonatomic) NSString *headerTitle;
@property (nonatomic) NSString *headerText;

@property (nonatomic) TRZSlideLicenseViewFooterType footerType;
@property (nonatomic) NSString *footerTitle;
@property (nonatomic) NSString *footerText;

// Color of the license titles. (Default: Red)
@property (nonatomic) UIColor *titleColor;

// Color of the license text. (Default: Dark Grey)
@property (nonatomic) UIColor *textColor;

@end
