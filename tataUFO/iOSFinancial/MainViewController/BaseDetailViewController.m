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
    
        [self.tabBarController dismissViewControllerAnimated:YES completion:^{
            
        }];
    if ([alertView.message isEqualToString:@"您想以6.00元的价格购买一个60颗星星糖吗？"]) {
        self.isOpen = YES;
        
        __weakSelf;

        BaseDetailViewController *detail4 = [[BaseDetailViewController alloc] init];
        detail4.isHidnBar = YES;
        
        [detail4 setImage:HTImage(@"kuaisugoumai1") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            [weakSelf setAlerConten:@"购买成功" withLeftBtn:nil rightBtn:@"我知道了"];
            
        }];
        detail4.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detail4 animated:NO];

    }
    if ([alertView.message isEqualToString:@"购买成功"]) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (void)refreshView:(UIImage *)image
{
    self.contentImage = image;
    [self.tableView reloadData];

}

- (void)tongzhi
{
    if (self.isRecharge) {
        [self.navigationController popViewControllerAnimated:NO];
    }
}

- (void)tongzhi1
{
    if (self.isRecharge) {
        [self.navigationController popToRootViewControllerAnimated:NO];
    }
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
    if (_cellToucheBlock&&!self.alertContent) {
        _cellToucheBlock(indexPath);
       
    }else{
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:self.alertContent delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles: nil];
        self.alertContent = nil;
        [alert show];
    }
        
}

- (void)returnBackRootView:(UIViewController *)vc
{
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 400, APPScreenWidth, 120)];
    [btn setTitle:@"返回首页" forState:UIControlStateNormal];
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
    BaseDetailViewController *detail3 = [[BaseDetailViewController alloc] init];
    detail3.isHidnBar = YES;
    [detail3 setImage:HTImage(@"kuaisugoumai") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        if (weakSelf.isOpen) {
           
        }else
        {
        [weakSelf setAlerConten:@"您想以6.00元的价格购买一个60颗星星糖吗？" withLeftBtn:@"普通支付" rightBtn:@"tata支付"];

        }
        
    }];
    detail3.hidesBottomBarWhenPushed = YES;
    [weakSelf.navigationController pushViewController:detail3 animated:YES];
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
