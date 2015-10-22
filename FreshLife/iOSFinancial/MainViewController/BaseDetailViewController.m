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
    [self.tableView reloadData];
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
    
    if (tabbar.showType == ShowTypeInvest) {
        //  获得20元现金券
        [self.tabBarController dismissViewControllerAnimated:YES completion:nil];
        return;
    }
    
    
    NSLog(@"%ld",(long)buttonIndex);
    if (buttonIndex == 1){
        if ([alertView.message isEqualToString:@"恭喜您已获得鲜life满69元即可免运费的资格，继续完成投资即可活动20元优惠券"]) {

            CloudTabbarController *tab = [[CloudTabbarController alloc] init];
            tab.selectedIndex = 1;
            [self presentViewController:tab animated:YES completion:nil];
        }
        
    }else{
        if (!_isPush) {
            [self.navigationController popToRootViewControllerAnimated:YES];
        }else
        {
            if ([alertView.message isEqualToString:@"恭喜您已获得鲜life满69元即可免运费的资格，继续完成投资即可活动20元优惠券"]) {
                [self.navigationController popToViewController:self.navigationController.viewControllers[2] animated:YES];
            }else{
                _cellToucheBlock(_index);
            }
        }
    }
    
}

- (void)shouquanWith:(NSString *)content
{
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(50, 280, APPScreenWidth - 100, 60)];
    lable.text = content;
    lable.textAlignment = NSTextAlignmentCenter;
    lable.backgroundColor = [UIColor  blackColor];
    lable.textColor = [UIColor whiteColor];
    [self.view addSubview:lable];

    
    [UIView animateWithDuration:1.8 animations:^{
        lable.alpha = 0.3;
    } completion:^(BOOL finished) {
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
    if (_cellToucheBlock) {
        _cellToucheBlock(indexPath);
    }
}


@end
