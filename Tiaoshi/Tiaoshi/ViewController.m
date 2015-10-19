//
//  ViewController.m
//  OTCoverDemo
//
//  Created by yechunxiao on 14-9-21.
//  Copyright (c) 2014年 yechunxiao. All rights reserved.
//

#import "ViewController.h"
#import "OTCover.h"
#import "WebViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
{
    WebViewController *webVC;
}
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
    
    self.navigationController.navigationBar.titleTextAttributes = @{UITextAttributeTextColor: [UIColor orangeColor],
        UITextAttributeFont : [UIFont boldSystemFontOfSize:18]};
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
                    cell.imageView.image = [UIImage imageNamed:@"my_Recharge@2x"];
                    cell.textLabel.text = @"余额";
                }
                    break;
                case 1:
                {
                    cell.imageView.image = [UIImage imageNamed:@"yzh@2x"];
                    cell.textLabel.text = @"云账户理财";
                }
                    break;
                case 2:
                {
                    cell.imageView.image = [UIImage imageNamed:@"my_address2@2x.png"];
                    cell.textLabel.text = @"地址管理";

                }
                    break;
                case 3:
                {
                    cell.imageView.image = [UIImage imageNamed:@"my_coupon@2x"];
                    cell.textLabel.text = @"优惠券";

                }
                    break;
                case 4:
                {
                    cell.imageView.image = [UIImage imageNamed:@"my_message@2x"];
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
    if (indexPath.row == 1) {
        webVC = [[WebViewController alloc]init];
        [webVC setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:webVC animated:YES];

    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end


