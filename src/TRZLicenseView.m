//
//  TRZLicenseView.m
//  TRZSlideLicenseViewController
//
//  Created by yam on 2014/04/18.
//  Copyright (c) 2014年 yam. All rights reserved.
//

#import "TRZLicenseView.h"

@implementation TRZLicenseView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"TRZLicenseView" owner:self options:nil] objectAtIndex:0];
        view.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        [self addSubview:view];
    }
    return self;
}

@end
