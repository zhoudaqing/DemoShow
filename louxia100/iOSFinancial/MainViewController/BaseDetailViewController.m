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
    if ([alertView.message isEqualToString:@"恭喜您已获得楼下100双倍返现资格，完成订单即可返现至“我的余额”中。"]) {
        [self.navigationController popToViewController:self.navigationController.viewControllers[1] animated:YES];
    }
    if ([alertView.message isEqualToString:@"恭喜您获得楼下100免邮资格，下单即可体验。"]) {
        [self.navigationController popToViewController:self.navigationController.viewControllers[1] animated:YES];
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
    BaseDetailViewController *detail8 = [[BaseDetailViewController alloc] init];
    detail8.title = @"订单详情";
    __weak BaseDetailViewController *weakbase = detail8;
    [detail8 setImage:HTImage(@"dingdanxiangqing") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        BaseDetailViewController *detail9 = [[BaseDetailViewController alloc] init];
        detail9.title = @"100金融活动说明";
        
        [detail9 setImage:HTImage(@"dingdanhuodongshuoming") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            CloudTabbarController *VC = [[CloudTabbarController alloc]init];
            
            [VC changeMessageWith:@"恭喜您已获得楼下100的20元返现，返回“我的余额”查看。"];
            VC.selectedIndex = 1;
            [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];
            [weakSelf.navigationController popToViewController:weakSelf.navigationController.viewControllers[2] animated:NO];
            [weakbase refreshView:HTImage(@"dingdanxiangqingback")];
        }];
        
        
        [weakSelf.navigationController pushViewController:detail9 animated:YES];
        
    }];
    
    [weakSelf.navigationController pushViewController:detail8 animated:YES];
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
    if (self.isAddBtn) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(272, 550, 100, 60)];
        [btn addTarget:self action:@selector(invested) forControlEvents:UIControlEventTouchUpInside];
        [self.tableView addSubview:btn];
    }
    
}

@end
