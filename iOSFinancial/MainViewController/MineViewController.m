//
//  MineViewController.m
//  XianLife
//
//  Created by Mr.Yan on 15/10/13.
//  Copyright © 2015年 Mr.Yan. All rights reserved.
//

#import "MineViewController.h"
#import "CloudTabbarController.h"

@interface MineViewController ()


@end

@implementation MineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.isStyleLight = NO;
    
    [self.navigationController.navigationBar setBarTintColor:HTWhiteColor];
    [self.navigationController.navigationBar setTintColor:[UIColor jt_barTintColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor],NSFontAttributeName : [UIFont systemFontOfSize:18]}];
    self.title = @"我的";

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    if (section == 2) {
        return 3;
    }
    return 2;
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
        {
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 90)];
            [imageView setImage:[UIImage imageNamed:@"tuceng1"]];
            [cell addSubview:imageView];
        }
            break;
        case 1:
        {
            switch (indexPath.row) {
                case 0:
                {
                    cell.imageView.image = [UIImage imageNamed:@"dingdanguanli_icon"];
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                    cell.detailTextLabel.text = @"查看全部订单";
                    cell.textLabel.text = @"我的订单";
                }
                    break;
                    
                default:
                {
                    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64 )];
                    [imageView setImage:[UIImage imageNamed:@"tuceng2"]];
                    [cell addSubview:imageView];
                }
                    break;
            }
        }
            break;
        case 2:
        {
            switch (indexPath.row) {
                case 0:
                {
                    cell.textLabel.text = @"我的理财";
                    cell.imageView.image = [UIImage imageNamed:@"yzh"];
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                }
                    break;
                case 1:
                {
                    cell.textLabel.text = @"我的优惠券";
                    cell.imageView.image = [UIImage imageNamed:@"youhuijuan_icon"];
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

                }
                    break;
                default:
                {
                    cell.textLabel.text = @"收货地址与管理";
                    cell.imageView.image = [UIImage imageNamed:@"dingdanguanli_icon"];
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                }
                    break;
            }
        }
            break;
        case 3:
        {
            switch (indexPath.row) {
                case 0:
                {
                    cell.textLabel.text = @"关注的商品";
                    cell.imageView.image = [UIImage imageNamed:@"wodeguanzhu_icon"];
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                }
                    break;
                    
                default:
                {
                    cell.textLabel.text = @"收货地址与管理";
                    cell.imageView.image = [UIImage imageNamed:@"shouhuodizhi_icon"];
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                }
                    break;
            }
        }
            break;
        case 4:
        {
            switch (indexPath.row) {
                case 0:
                {
                    cell.textLabel.text = @"联系鲜生活";
                    cell.imageView.image = [UIImage imageNamed:@"lianxixianlife_icon"];
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                }
                    break;
                    
                default:
                {
                    cell.textLabel.text = @"意见反馈";
                    cell.imageView.image = [UIImage imageNamed:@"yijian_icon"];
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                }
                    break;
            }
        }
            break;
        default:
            switch (indexPath.row) {
                case 0:
                {
                    cell.textLabel.text = @"关于生活";
                    cell.imageView.image = [UIImage imageNamed:@"guanyuxianlife_icon"];
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                }
                    break;
                    
                default:
                {
                    cell.textLabel.text = @"清楚本地缓存";
                    cell.imageView.image = [UIImage imageNamed:@"qingchuhuancun_icon"];
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                }
                    break;
            }
            
            break;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 5) {
        return 0;
    }
    return 10;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 90;
    }
    if (indexPath.section == 1&& indexPath.row == 1) {
        return 64;
    }
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    CloudTabbarController *VC = [[CloudTabbarController alloc]init];
    [self.navigationController presentViewController:VC animated:YES completion:nil];
}



@end
