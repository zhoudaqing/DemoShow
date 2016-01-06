//
//  FirstViewController.m
//  CommonProject
//
//  Created by Mr.Yang on 15/10/19.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "FirstViewController.h"
#import "CustomInvestGuideViewController.h"
#import "CloudTabbarController.h"

@interface FirstViewController ()

@property (nonatomic) UITapGestureRecognizer *tap;

@end

@implementation FirstViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setImage:HTImage(@"jingxuan") WithTouchBlock:^(NSIndexPath *indexPath) {
        

}];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 60, 90, 90)];
    [btn addTarget:self action:@selector(songmeigui) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:btn];

}
- (void)songmeigui
{
    
    __weakSelf;
    BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
    detailN.isHidnBar = YES;
    [detailN setImage:HTImage(@"woyaozu") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
        detailN.isHidnBar = YES;
        [detailN setImage:HTImage(@"woyaozuhuodongshuoming") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
            detailN.title = @"Zank金融活动说明";
            
            [detailN setImage:HTImage(@"Zankjinronghuodong") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                CloudTabbarController *VC = [[CloudTabbarController alloc]init];
                [VC changeMessageWith:@"玫瑰已送出!"];
                VC.selectedIndex = 1;
                [weakSelf.navigationController presentViewController:VC animated:YES completion:^{
                    [weakSelf.navigationController popToRootViewControllerAnimated:NO];
                }];
            }];
            detailN.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:detailN animated:YES];
        }];
        detailN.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detailN animated:NO];
        
    }];
    detailN.hidesBottomBarWhenPushed = YES;
    [weakSelf.navigationController pushViewController:detailN animated:YES];
    
   }

- (void)mianbaiozhengjin
{
    __weakSelf;
    
    BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
    detailN.title = @"";
    detailN.isHidnBar = YES;
    __weak  BaseDetailViewController  *weakBase = detailN;
    [detailN setImage:HTImage(@"miaobaozhengjin") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
        detailN.title = @"大咖金融活动说明";
        
        [detailN setImage:HTImage(@"miaobaozhengjinhuodong") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            CloudTabbarController *VC = [[CloudTabbarController alloc]init];
            [VC changeMessageWith:@"恭喜您完成本次投资，您可以自由去参拍啦！"];
            VC.selectedIndex = 1;
            [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];
            [weakBase refreshView:HTImage(@"miaobaozhengjinBack")];
            weakBase.tableView.userInteractionEnabled = NO;
            [self.navigationController popViewControllerAnimated:YES];
            
        }];
        detailN.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detailN animated:YES];
        
    }];
    detailN.hidesBottomBarWhenPushed = YES;
    [weakSelf.navigationController pushViewController:detailN animated:YES];
}

@end


