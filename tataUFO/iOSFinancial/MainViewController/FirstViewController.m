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
{
    UIImageView *imageView;
}
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
    
    __weakSelf;

    [self setImage:HTImage(@"jingxuan") WithTouchBlock:^(NSIndexPath *indexPath) {
        BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
        detailN.title = @"";
        detailN.isHidnBar = YES;
        __weak  BaseDetailViewController  *weakBase = detailN;
        [detailN setImage:HTImage(@"woyaozu") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            if (weakBase.isOpen) {
                BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
                detailN.title = @"tataUFO金融活动说明";
                
                [detailN setImage:HTImage(@"woyaozuhuodongshuoming") WithTouchBlock:^(NSIndexPath *indexPath) {
                    
                    CloudTabbarController *VC = [[CloudTabbarController alloc]init];
                    [VC changeMessageWith:@"玫瑰已送出~！"];
                    VC.selectedIndex = 1;
                    [weakSelf.navigationController presentViewController:VC animated:YES completion:^{
                        [weakSelf.navigationController popToViewController:weakSelf.navigationController.viewControllers[1] animated:NO];
                        [imageView removeFromSuperview];
                    }];
                    
                    
                }];
                detailN.hidesBottomBarWhenPushed = YES;
                [weakSelf.navigationController pushViewController:detailN animated:YES];

            }else
            {
                imageView =[[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
                [imageView setImage:HTImage(@"zhezhaoer")];
                [weakBase.view addSubview:imageView];
                weakBase.isOpen = YES;
            }
            
            
        }];
        detailN.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detailN animated:YES];

        
}];
    
    self.tableView.frame = CGRectMake(0, -20, APPScreenWidth, APPScreenHeight+40);
}
- (void)woyaozu
{
    
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
        detailN.title = @"tata金融活动说明";
        
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


