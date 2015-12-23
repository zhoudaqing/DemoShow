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
    [self.navigationController.navigationBar setBackgroundImage:HTImage(@"jingxuanhead") forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    [self setImage:HTImage(@"jingxuan") WithTouchBlock:^(NSIndexPath *indexPath) {
        
}];
    
    self.tableView.frame = CGRectMake(0, -20, APPScreenWidth, self.view.height+20);
    
    UIButton *mianbaiozhengjin = [[UIButton alloc]initWithFrame:CGRectMake(0, 200, APPScreenWidth, 150)];
    [mianbaiozhengjin addTarget:self action:@selector(mianbaiozhengjin) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:mianbaiozhengjin];

}
- (void)woyaozu
{
    __weakSelf;
    
    BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
    detailN.title = @"";
    detailN.isHidnBar = YES;
    __weak  BaseDetailViewController  *weakBase = detailN;
    [detailN setImage:HTImage(@"woyaozu") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
        detailN.title = @"易车金融活动说明";
        
        [detailN setImage:HTImage(@"woyaozuhuodongshuoming") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            CloudTabbarController *VC = [[CloudTabbarController alloc]init];
            [VC changeMessageWith:@"恭喜您完成投资，稍后工作人员会联系您安排寄送安装等相关事宜，请耐心等待！"];
            VC.selectedIndex = 1;
            [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];
            [weakBase refreshView:HTImage(@"yizu")];
            weakBase.tableView.userInteractionEnabled = NO;
            [self.navigationController popViewControllerAnimated:YES];
            
        }];
        detailN.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detailN animated:YES];
        
    }];
    detailN.hidesBottomBarWhenPushed = YES;
    [weakSelf.navigationController pushViewController:detailN animated:YES];
}

- (void)mianbaiozhengjin
{
   
            
            CloudTabbarController *VC = [[CloudTabbarController alloc]init];
            [VC showPromptView];
            [self.navigationController presentViewController:VC animated:YES completion:nil];
    
}

@end


