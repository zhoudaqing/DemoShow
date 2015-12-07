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
{
    UIImageView *_heart;
}
@end

@implementation ViewController2


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    __weakSelf;

    [self setImage:HTImage(@"mine") WithTouchBlock:^(NSIndexPath *indexPath) {
        CloudTabbarController *VC = [[CloudTabbarController alloc]init];
        [VC showPromptView];
        [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];
        
    }];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(150, 20, APPScreenWidth, 60)];
    btn.tag = 1;
    [btn addTarget:self action:@selector(huangguan:) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:btn];
    
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(60, 10, 80, 70)];
    [btn1 addTarget:self action:@selector(huangguan:) forControlEvents:UIControlEventTouchUpInside];
    btn1.tag = 2;
    [self.tableView addSubview:btn1];
    
    _heart = [[UIImageView alloc]initWithFrame:CGRectMake(55, 55, 31, 31)];
    [_heart setImage:HTImage(@"heart")];
    [self.tableView addSubview:_heart];
    
}

- (void)huangguan:(id)sender
{
    UIButton *btn = sender;
    __weakSelf;
    
    BaseDetailViewController *detail9 = [[BaseDetailViewController alloc] init];
    detail9.title = @"商城";
    
    [detail9 setImage:HTImage(@"shangchengjifen") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        
        
        BaseDetailViewController *detail9 = [[BaseDetailViewController alloc] init];
        detail9.title = @"免费升级";
        
        [detail9 setImage:HTImage(@"mianfeishengji") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            CloudTabbarController *VC = [[CloudTabbarController alloc]init];
            VC.selectedIndex = 1;
            if (btn.tag ==1) {
                [VC changeMessageWith:@"恭喜您已获得blued至尊会员，可免费享用至尊会员的全部服务，请返回查看。"];
                [self refreshView:HTImage(@"mineback")];
            }
            if (btn.tag == 2) {
                [_heart setImage:HTImage(@"hearts")];
                [VC changeMessageWith:@"恭喜您已点亮双人恩爱标识。"];
            }
            [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];
            [weakSelf.navigationController popToViewController:weakSelf.navigationController.viewControllers[0] animated:NO];
            if (btn.tag ==1) {
                [VC changeMessageWith:@"恭喜您已获得blued至尊会员，可免费享用至尊会员的全部服务，请返回查看。"];
                [self refreshView:HTImage(@"mineback")];
            }
            if (btn.tag == 2) {
                [_heart setImage:HTImage(@"hearts")];
                [VC changeMessageWith:@"恭喜您已点亮双人恩爱标识。"];
            }
        }];
    
        [weakSelf.navigationController pushViewController:detail9 animated:YES];
    
    }];
    
    detail9.hidesBottomBarWhenPushed = YES;
    [weakSelf.navigationController pushViewController:detail9 animated:YES];
}
@end
