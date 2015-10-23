//
//  BaseDetailViewController.m
//  FreshLife
//
//  Created by Mr.Yang on 15/10/15.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "BaseDetailViewController.h"
#import "ContentCell.h"
#import "CloudTabbarController.h"

@interface BaseDetailViewController ()<UIAlertViewDelegate>
{
    BOOL _isPush;
    NSIndexPath *_index;

}
@end

@implementation BaseDetailViewController

- (void)setImage:(UIImage *)image WithTouchBlock:(void (^)(NSIndexPath *))touchBlock
{
    self.contentImage = image;
    self.cellToucheBlock = touchBlock;
    if (!_isPush) {
        [self.tableView reloadData];
    }
}

- (void)refreshView:(UIImage *)image
{
    self.contentImage = image;
    [self.tableView reloadData];
}

- (void)setAlerConten:(NSString *)conten withLeftBtn:(NSString *)leftTitle rightBtn:(NSString *)rightTitle isPush:(BOOL)ispu
{
    _isPush = ispu;
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:conten delegate:self cancelButtonTitle:leftTitle otherButtonTitles:rightTitle, nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    CloudTabbarController *tabbar = (CloudTabbarController *)self.navigationController.tabBarController;
    
    if ([tabbar isKindOfClass:[CloudTabbarController class]]) {
        if (tabbar.showType == ShowTypeInvest) {
            //  获得20元现金券
            [self.tabBarController dismissViewControllerAnimated:YES completion:nil];
            return;
        }
    }

    if (buttonIndex == 1){
        if ([alertView.message isEqualToString:@"恭喜您已获得鲜life满69元即可免运费的资格，继续完成投资即可活动20元优惠券"]) {
            [self.navigationController popToViewController:self.navigationController.viewControllers[1] animated:NO];
            CloudTabbarController *tab = [[CloudTabbarController alloc] init];
            tab.selectedIndex = 1;
            tab.showType = ShowTypeInvest;
            tab.actionPrompt = @"恭喜您已获得鲜life满69元即可免运费的资格，继续完成投资即可活动20元优惠券";
            [self presentViewController:tab animated:YES completion:nil];
        }
         if ([alertView.message isEqualToString:@"恭喜您已获得50元挑食现金券"]) {
             
         }
        
    }else{
        if (!_isPush) {
            if ([alertView.message isEqualToString:@"恭喜您已获得鲜life满69元即可免运费的资格，提交订单即可使用"]) {
                [self.navigationController popToViewController:self.navigationController.viewControllers[1] animated:YES];
            }else{
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }else
        {
            if ([alertView.message isEqualToString:@"恭喜您已获得鲜life满69元即可免运费的资格，继续完成投资即可活动20元优惠券"]) {
                [self.navigationController popToViewController:self.navigationController.viewControllers[1] animated:YES];
            }else if ([alertView.message isEqualToString:@"恭喜您已获得50元挑食现金券"]) {
                
            }
            else{
        _cellToucheBlock(_index);
            }        }
    }
    
}

- (void)shouquanShow
{
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(50, 280, APPScreenWidth - 100, 60)];
    lable.text = self.shouquan;
    lable.textAlignment = NSTextAlignmentCenter;
    lable.backgroundColor = [UIColor  blackColor];
    lable.textColor = [UIColor whiteColor];
    [self.view addSubview:lable];

    
    [UIView animateWithDuration:1.8 animations:^{
        lable.alpha = 0.3;
    } completion:^(BOOL finished) {
        _cellToucheBlock(_index);
        [lable removeFromSuperview];
    }];

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
    if (self.shouquan) {
        [self shouquanShow];
        return;
    }
    if (_cellToucheBlock) {
        _cellToucheBlock(indexPath);
    }
}


@end
