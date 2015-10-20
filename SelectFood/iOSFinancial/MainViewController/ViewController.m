//
//  ViewController.m
//  OTCoverDemo
//
//  Created by yechunxiao on 14-9-21.
//  Copyright (c) 2014年 yechunxiao. All rights reserved.
//

#import "ViewController.h"
#import "OTCover.h"
#import "BaseDetailViewController.h"
#import "CloudTabbarController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

@end

@implementation ViewController
{
    UIScrollView *scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    OTCover *test = [[OTCover alloc] initWithTableViewWithHeaderImage:[UIImage imageNamed:@"image.png"] withOTCoverHeight:200];
    test.tableView.delegate = self;
    test.tableView.dataSource = self;
    [self.view addSubview:test];

    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [test.tableView setTableFooterView:view];
    
    self.title = @"我的";
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 5;
    }
    
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                {
                    cell.imageView.image = [UIImage imageNamed:@"my_Recharge"];
                    cell.textLabel.text = @"余额";
                    
                    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(APPScreenWidth -110, 6, 80, 32)];
                    [image setImage:HTImage(@"UMS_shake__share_button")];
                    [cell addSubview:image];
                }
                    break;
                case 1:
                {
                    cell.imageView.image = [UIImage imageNamed:@"yzh"];
                    cell.textLabel.text = @"云账户理财";
                }
                    break;
                case 2:
                {
                    cell.imageView.image = [UIImage imageNamed:@"my_address2"];
                    cell.textLabel.text = @"地址管理";

                }
                    break;
                case 3:
                {
                    cell.imageView.image = [UIImage imageNamed:@"my_coupon"];
                    cell.textLabel.text = @"优惠券";

                }
                    break;
                case 4:
                {
                    cell.imageView.image = [UIImage imageNamed:@"my_message"];
                    cell.textLabel.text = @"我的消息";

                }
                    break;
                default:
                    
                    break;
            }
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        default:
            cell.textLabel.text = @"4000-121-777";
            cell.textLabel.textColor = [UIColor orangeColor];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            break;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 10;
    }
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 10;
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.row == 0) {
        [self pushViewControllers];
        
    }else {
        
        CloudTabbarController *tab = [[CloudTabbarController alloc] init];
        [self presentViewController:tab animated:YES completion:nil];
        
    }
    
}

- (void)pushViewControllers
{
    __weakSelf;
    
    //  付款页面
    BaseDetailViewController *detail = [[BaseDetailViewController alloc] init];
    detail.title = @"充值";
    [detail setImage:HTImage(@"pay_selectPage") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        //  活动说明页面
        BaseDetailViewController *detail = [[BaseDetailViewController alloc] init];
        detail.title = @"活动说明";
        [detail setImage:HTImage(@"action_rechargeMoney") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            CloudTabbarController *tab = [[CloudTabbarController alloc] init];
            tab.selectedIndex = 1;
            [weakSelf presentViewController:tab animated:YES completion:nil];
            
        }];
        
        [weakSelf.navigationController pushViewController:detail animated:YES];
        
    }];
     
    detail.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detail animated:YES];
}


@end


