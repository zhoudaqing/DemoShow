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
    self.title = @"我的";
    __weakSelf;

    [self setImage:HTImage(@"mine") WithTouchBlock:^(NSIndexPath *indexPath) {
        CloudTabbarController *VC = [[CloudTabbarController alloc]init];
        [VC showPromptView];
        [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];
        
    }];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, APPScreenWidth, 60)];
    [btn addTarget:self action:@selector(huangguan) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)huangguan
{
    __weakSelf;
    
    BaseDetailViewController *detail9 = [[BaseDetailViewController alloc] init];
    detail9.title = @"商城";
    
    [detail9 setImage:HTImage(@"shangchengjifen") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        
        
        BaseDetailViewController *detail9 = [[BaseDetailViewController alloc] init];
        detail9.title = @"免费升级";
        
        [detail9 setImage:HTImage(@"mianfeishengji") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            CloudTabbarController *VC = [[CloudTabbarController alloc]init];
            [VC changeMessageWith:@"恭喜您已获得blued至尊会员，可免费享用至尊会员的全部服务，请返回查看。"];
            VC.selectedIndex = 1;
            [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];
            [weakSelf.navigationController popToViewController:weakSelf.navigationController.viewControllers[0] animated:NO];
            [self refreshView:HTImage(@"mineback")];
        }];
    
        [weakSelf.navigationController pushViewController:detail9 animated:YES];
    
    }];
    
    detail9.hidesBottomBarWhenPushed = YES;
    [weakSelf.navigationController pushViewController:detail9 animated:YES];
}
@end
