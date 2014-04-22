//
//  TRZSlideLicenseViewController2.m
//  TRZSlideLicenseViewController
//
//  Created by yam on 2014/04/23.
//  Copyright (c) 2014年 yam. All rights reserved.
//

#import "TRZSlideLicenseViewController.h"
#import "TRZSlideLicenseScrollView.h"

@interface TRZSlideLicenseViewController ()

@end

@implementation TRZSlideLicenseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect viewRect;
    if (self.navigationController) {
        viewRect = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height -64);
    } else {
        viewRect = self.view.frame;
    }
    TRZSlideLicenseScrollView *slideLicenseScrollView = [[TRZSlideLicenseScrollView alloc] initWithFrame:viewRect];
    slideLicenseScrollView.delegate = self;
    [self.view addSubview:slideLicenseScrollView];
    self.navigationController.navigationItem.title = @"Slide License View";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - scrollView delegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    //    NSLog(@"scrollViewWillBeginDragging:");
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //    NSLog(@"scrollViewDidScroll");
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    NSLog(@"scrollViewWillEndDragging:velocity:%f, offset:%f",velocity.x,targetContentOffset->x);
    if (abs(velocity.x) > 1) {
        scrollView.pagingEnabled = NO;
        NSLog(@"scrollViewPagingDisabled");
    } else if (velocity.x == 0) {
        if (!scrollView.pagingEnabled) {
            scrollView.pagingEnabled = YES;
            NSLog(@"scrollViewPagingEnabled");
        }
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    //    NSLog(@"scrollViewDidEndDragging");
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    //    NSLog(@"scrollViewWillBeginDecelerating");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidEndDecelerating:%f",scrollView.contentOffset.x);
    if (!scrollView.pagingEnabled) {
        scrollView.pagingEnabled = YES;
        NSLog(@"scrollViewPagingEnabled");
    }
    
    CGFloat endPoint = scrollView.contentOffset.x;
    CGFloat width = scrollView.frame.size.width;
    int quo = endPoint / width;
    CGFloat mod = fmod(endPoint, width);
    CGFloat tgtPoint;
    NSLog(@"quo:%d, mod:%f",quo, mod);
    if (mod) {
        if (mod > width / 2) {
            tgtPoint = width * (quo + 1);
        } else {
            tgtPoint = width * quo;
        }
        NSLog(@"fitEdgeTo:tgtPoint:%f", tgtPoint);
        [scrollView scrollRectToVisible:CGRectMake(tgtPoint, scrollView.contentOffset.y, scrollView.frame.size.width, scrollView.frame.size.height) animated:YES];
    }
}

@end
