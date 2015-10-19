//
//  LocalStoreViewController.m
//  FreshLife
//
//  Created by Mr.Yang on 15/10/14.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "LocalStoreViewController.h"
#import "HTADScrollView.h"
#import "ActionWebViewController.h"
#import "UIView+NoneDataView.h"
#import "ContentCell.h"
#import "StoreDetailViewController.h"
#import "BaseDetailViewController.h"
#import "CloudTabbarController.h"
#import "StoreDetailViewController.h"


@interface LocalStoreViewController ()

@property (nonatomic, strong)   HTADScrollView *adScrollView;


@end


@implementation LocalStoreViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.tableHeaderView = self.adScrollView;
    
    __weakSelf;
    [self setImage:HTImage(@"content") WithTouchBlock:^(NSIndexPath *indexPath) {
        StoreDetailViewController *detail = [[StoreDetailViewController alloc] init];
        detail.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detail animated:YES];
    }];
    
}

//  MARK:广告滚动视图
- (HTADScrollView *)adScrollView
{
    if (!_adScrollView) {
        
        CGFloat height = 150.0f;
        if (is55Inch) {
            height = 166.0f;
        }
        
        NSArray *images = @[HTImage(@"advise_1"), HTImage(@"advise_2"), HTImage(@"advise_3")];
        
        _adScrollView = [[HTADScrollView alloc] initWithFrame:CGRectMake(0, 0, APPScreenWidth, 107) images:images andTitles:nil];
        
        __weakSelf;
        [_adScrollView setTouchBlock:^(NSInteger index) {
            [weakSelf adverViewTouchIndedIndex:index];
        }];
    }
    
    return _adScrollView;
}

//  广告试图单击的位置
- (void)adverViewTouchIndedIndex:(NSInteger)index
{
//    StoreDetailViewController *detail = [[StoreDetailViewController alloc] init];
//    detail.title = @"活动详情";
//    __weakSelf;
//    
//    detail.hidesBottomBarWhenPushed = YES;
//    [weakSelf.navigationController pushViewController:detail animated:YES];
//    detail.view.hidden = YES;
//    detail.view.hidden = NO;
//    
//    [detail setImage:HTImage(@"jianGuoDetail") WithTouchBlock:^(NSIndexPath *indexPath) {
//        CloudTabbarController *tabbar = [[CloudTabbarController alloc] init];
//        [weakSelf presentViewController:tabbar animated:YES completion:nil];
//    }];

    
    /*
    NSString *urlStr = [dict stringForKey:@"herf"];
    
    if (isEmpty(urlStr)) {
        //  如果为空，则不做任何操作
        return;
    }
    
    if ([urlStr isEqualToString:@"com.yyyy.jdlc://project"]) {
        self.tabBarController.selectedIndex = 1;
        return;
    }
    
    ActionWebViewController *webVC = [[ActionWebViewController alloc] init];
    webVC.url = HTURL(urlStr);
    
    webVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:webVC animated:YES];
     */
    
}



@end
