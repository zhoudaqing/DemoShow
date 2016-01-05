//
//  BaseDetailViewController.m
//  FreshLife
//
//  Created by Mr.Yang on 15/10/15.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "BaseDetailViewController.h"
#import "ContentCell.h"
#import "CustomInvestGuideViewController.h"
#import "CloudTabbarController.h"

@interface BaseDetailViewController ()<UIAlertViewDelegate>
{
    NSIndexPath *_index;
}
@end

@implementation BaseDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (_viewDidLoadBlock) {
        _viewDidLoadBlock(self);
    }
    UIButton *btn = [[UIButton alloc]initWithFrame:self.btnFrame];
    [self.tableView addSubview:btn];
    [btn addTarget:self action:@selector(nextplan) forControlEvents:UIControlEventTouchUpInside];
}

- (void)nextplan
{
    _cellToucheBlock(_index);

}


- (void)setImage:(UIImage *)image WithTouchBlock:(void (^)(NSIndexPath *))touchBlock
{
    self.contentImage = image;
    self.cellToucheBlock = touchBlock;
}

- (void)setBackImage:(UIImage *)image WithTouchBlock:(void (^)(NSIndexPath *))TouchBlock
{
    UIImageView *backImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, APPScreenWidth, APPScreenHeight)];
    [backImage setImage:HTImage(@"shouyeBack")];
    [self.view addSubview:backImage];
    self.contentImage = [UIImage imageNamed:@""];
    self.cellToucheBlock = TouchBlock;
}

- (void)setAlerConten:(NSString *)conten withLeftBtn:(NSString *)leftTitle rightBtn:(NSString *)rightTitle
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:conten delegate:self cancelButtonTitle:leftTitle otherButtonTitles:rightTitle, nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{

    if([alertView.message isEqualToString:@"恭喜，您的薄荷金融服务已开通，同时也已获得了薄荷免邮券一张，请返回查看"]) {

        [self.navigationController popToViewController:self.navigationController.viewControllers[3] animated:YES];
        
    }
    if ([alertView.message isEqualToString:@"恭喜您已获得200个薄荷钻石，快去看看吧"]) {
        [self.tabBarController dismissViewControllerAnimated:YES completion:nil];
    }
    if ([alertView.message isEqualToString:@"恭喜您获得薄荷6元优惠券，可在购物支付时抵现金使用。"]) {
        [self.navigationController popToViewController:self.navigationController.viewControllers[4] animated:YES];
    }
    if ([alertView.message isEqualToString:@"为了保障您的资金安全，请先完善信息。"]) {
        _cellToucheBlock(_index);

    }
    if ([alertView.message isEqualToString:@"恭喜，您的薄荷金融服务已开通，同时也已获得了1元现金，连续7天记录体重即可每天都获得1元现金哦~"]) {
        [self.navigationController popToViewController:self.navigationController.viewControllers[2] animated:YES];
    }
}

- (void)refreshView:(UIImage *)image
{
    self.contentImage = image;
    [self.tableView reloadData];

}

#pragma mark -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.contentImage.size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContentCell *cell = nil;
    
    cell = [[ContentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.contentImageView.image = self.contentImage;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _index = indexPath;
    if (_cellToucheBlock&&!self.alertContent&&((int)self.btnFrame.origin.y == 0)) {
        _cellToucheBlock(indexPath);
       
    }else{
        
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:self.alertContent delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles: nil];
//        self.alertContent = nil;
//        [alert show];
    }
}

- (void)returnBackRootView:(UIViewController *)vc
{
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 400, APPScreenWidth, 120)];
    [btn setTitle:@"" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(popTOView:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)popTOView:(UIViewController *)vc
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)invested
{

    __weakSelf;
    //  结算页面

        
        BaseDetailViewController *detail4 = [[BaseDetailViewController alloc] init];
        detail4.title = @"我的订单";
        __weak BaseDetailViewController *weakBase1 = detail4;
        [detail4 setImage:HTImage(@"wodedingdan") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            BaseDetailViewController *detail5 = [[BaseDetailViewController alloc] init];
            detail5.title = @"薄荷金融 优惠大放送";
            detail5.alertContent = @"为了保障您的资金安全，请先完善信息。";
            [detail5 setImage:HTImage(@"shenmindalibaohuo") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                BaseDetailViewController *detail9 = [[BaseDetailViewController alloc] init];
                detail9.title = @"绑定验证";
                
                [detail9 setImage:HTImage(@"kaihuxingmingyanzheng") WithTouchBlock:^(NSIndexPath *indexPath) {
                    BaseDetailViewController *detail9 = [[BaseDetailViewController alloc] init];
                    detail9.title = @"银行卡验证";
                    
                    [detail9 setImage:HTImage(@"client_validate_card") WithTouchBlock:^(NSIndexPath *indexPath) {
                        
                        [weakSelf setAlerConten:@"恭喜您获得薄荷6元优惠券，可在购物支付时抵现金使用。" withLeftBtn:@"我知道了" rightBtn:nil];
                        [weakBase1 refreshView:HTImage(@"wodedingdanback")];
                        [weakBase1 returnBackRootView:nil];
                    }];
                    detail9.hidesBottomBarWhenPushed = YES;
                    [weakSelf.navigationController pushViewController:detail9 animated:YES];

                    
                }];
                detail9.hidesBottomBarWhenPushed = YES;
                [weakSelf.navigationController pushViewController:detail9 animated:YES];

                
            }];
            detail5.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:detail5 animated:YES];

            
        }];
        detail4.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detail4 animated:YES];
        

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.isHidnBar) {
        self.navigationController.navigationBar.hidden = YES;
        UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(2, 32, 88, 88)];
        [self.view addSubview:backBtn];
        [backBtn addTarget:self action:@selector(dismissViewController) forControlEvents:UIControlEventTouchUpInside];
        self.tableView.frame = CGRectMake(0, -20, APPScreenWidth, APPScreenHeight+40);
    }else
    {
        self.navigationController.navigationBar.hidden = NO;
        [self.navigationController.navigationBar setBackgroundImage:HTImage(@"") forBarMetrics:UIBarMetricsDefault
         ];
    }
}


@end
