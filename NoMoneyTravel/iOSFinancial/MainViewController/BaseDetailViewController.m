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


@interface BaseDetailViewController ()<UIAlertViewDelegate>
{
    NSIndexPath *_index;
}
@end

@implementation BaseDetailViewController

- (void)setImage:(UIImage *)image WithTouchBlock:(void (^)(NSIndexPath *))touchBlock
{
    self.contentImage = image;
    self.cellToucheBlock = touchBlock;
}
- (void)setAlerConten:(NSString *)conten withLeftBtn:(NSString *)leftTitle rightBtn:(NSString *)rightTitle
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:conten delegate:self cancelButtonTitle:leftTitle otherButtonTitles:rightTitle, nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self.tabBarController dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popToRootViewControllerAnimated:YES];
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
    if (_cellToucheBlock&&!self.alertContent) {
        _cellToucheBlock(indexPath);
       
    }else{
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:self.alertContent delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles: nil];
        self.alertContent = nil;
        [alert show];
    }
        
}

- (void)invested
{
    __weakSelf;
    //  结算页面
    BaseDetailViewController *detail3 = [[BaseDetailViewController alloc] init];
    detail3.title = @"保险详情";
    [detail3 setImage:HTImage(@"baoxianxiangqing") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        [weakSelf.navigationController popToRootViewControllerAnimated:YES];
        
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
