//
//  TRZLicenseView.h
//  TRZSlideLicenseViewController
//
//  Created by yam on 2014/04/18.
//  Copyright (c) 2014年 yam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRZLicenseView : UIView

// Title
@property (weak, nonatomic) IBOutlet UITextView *libTitle;
@property (strong, nonatomic) UIColor *titleColor;

@property (weak, nonatomic) IBOutlet UITextView *libText;
@property (weak, nonatomic) IBOutlet UILabel *curPage;

@end
