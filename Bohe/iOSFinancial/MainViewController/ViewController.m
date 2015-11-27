//
//  ViewController.m
//  NoMoneyTravel
//
//  Created by Mr.Yang on 15/11/3.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "ViewController.h"
#import "CustomInvestGuideViewController.h"
#import "CloudTabbarController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"伙伴";
    __weakSelf;
    [self setImage:HTImage(@"zuanshidaka") WithTouchBlock:^(NSIndexPath *indexPath) {
        
            
            BaseDetailViewController *detail4 = [[BaseDetailViewController alloc] init];
            detail4.title = @"钻石兑换";
            __weak BaseDetailViewController *weakBase = detail4;
            [detail4 setImage:HTImage(@"zuanshiduihuan") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                BaseDetailViewController *detail5 = [[BaseDetailViewController alloc] init];
                detail5.title = @"薄荷金融钻石大放送";
                [detail5 setImage:HTImage(@"dafangsong") WithTouchBlock:^(NSIndexPath *indexPath) {
                    
                    CloudTabbarController *VC = [[CloudTabbarController alloc]init];
                    [VC changeMessageWith:@"恭喜您已获得200个薄荷钻石，快去看看吧"];
                    VC.selectedIndex = 1;
                    [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];
                    [weakSelf.navigationController popToViewController:weakSelf.navigationController.viewControllers[1] animated:NO];
                    [weakBase refreshView:HTImage(@"zuanshiduihuanback")];
                    
                }];
                detail5.hidesBottomBarWhenPushed = YES;
                [weakSelf.navigationController pushViewController:detail5 animated:YES];

                
            }];
            detail4.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:detail4 animated:YES];
            
        }];
    
    
    
}


@end
