//
//  TRZSlideLicenseScrollView.h
//  TRZSlideLicenseViewController
//
//  Created by yam on 2014/04/18.
//  Copyright (c) 2014年 yam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRZSlideLicenseScrollView : UIScrollView

/**
 *  The color of the library titles.
 */
@property (strong, nonatomic) UIColor *titleColor;

- (id)initWithFrame:(CGRect)frame licenses:(NSArray*)licenses;

@end
