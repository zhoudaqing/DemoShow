    //
//  ViewController2.m
//  NoMoneyTravel
//
//  Created by Mr.Yan on 15/11/3.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "ViewController2.h"
#import "CloudTabbarController.h"
@interface ViewController2 ()

@end

@implementation ViewController2


- (void)viewDidLoad {
    [super viewDidLoad];
    __weakSelf;
    [self setImage:HTImage(@"mine") WithTouchBlock:^(NSIndexPath *indexPath) {
        
    CloudTabbarController *VC = [[CloudTabbarController alloc]init];
    [weakSelf.navigationController presentViewController:VC animated:YES completion:^{
                    }];
        
    }];
    self.tableView.frame = CGRectMake(0, -20, APPScreenWidth, APPScreenHeight+20);
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0,190, APPScreenWidth, 60)];
    [btn addTarget:self action:@selector(dengjitisheng) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:btn];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)dengjitisheng
{
    __weakSelf;
    __weak  BaseDetailViewController  *weakBase = self;
    
        BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
        detailN.title = @"";
        detailN.isHidnBar = YES;
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 90, APPScreenWidth - 100, 100)];
    [btn addTarget:detailN action:@selector(invested) forControlEvents:UIControlEventTouchUpInside];
    [detailN.tableView addSubview:btn];
        [detailN setImage:HTImage(@"xingxingshangcheng") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
            detailN.title = @"tataUFO金融活动说明";
            
            [detailN setImage:HTImage(@"xingxingshangchenghuodong") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                CloudTabbarController *VC = [[CloudTabbarController alloc]init];
                [VC changeMessageWith:@"个人等级已经提升~！"];
                VC.selectedIndex = 1;
                [weakSelf.navigationController presentViewController:VC animated:YES completion:^{
                    [weakSelf.navigationController popToRootViewControllerAnimated:NO];
                    [weakBase refreshView:HTImage(@"mineback")];
                }];
                
                
            }];
            detailN.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:detailN animated:YES];
            
            
        }];
        detailN.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detailN animated:YES];
        
}

@end
