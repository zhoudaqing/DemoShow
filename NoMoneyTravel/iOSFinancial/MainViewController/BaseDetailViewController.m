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

    if([alertView.message isEqualToString:@"恭喜您已获得穷游20里程,可以兑换穷游的礼品时使用"]) {

        [self.navigationController popToViewController:self.navigationController.viewControllers[1] animated:YES];
        
    }
    if ([alertView.message isEqualToString:@"恭喜您已获得穷游100里程啦，可以兑换穷游的礼品时使用"]) {
        [self.tabBarController dismissViewControllerAnimated:YES completion:nil];
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

- (void)invested
{
    __weakSelf;
    //  结算页面
    BaseDetailViewController *detail3 = [[BaseDetailViewController alloc] init];
    detail3.title = @"帮助";
    [detail3 setImage:HTImage(@"bangzhu") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        BaseDetailViewController *detail4 = [[BaseDetailViewController alloc] init];
        detail4.title = @"穷游金融活动说明";
        
        [detail4 setImage:HTImage(@"yaoqinghuodongshuoming") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            
            BaseDetailViewController *detail5 = [[BaseDetailViewController alloc] init];
            detail5.title = @"帮助";
            
            [detail5 setImage:HTImage(@"bangzhujiamo") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                BaseDetailViewController *detail6 = [[BaseDetailViewController alloc] init];
                detail6.title = @"邮箱注册";
                
                [detail6 setImage:HTImage(@"youxiangzhuce") WithTouchBlock:^(NSIndexPath *indexPath) {
                    
                    BaseDetailViewController *detail7 = [[BaseDetailViewController alloc] init];
                    detail7.title = @"完善安全信息";
                    
                    [detail7 setImage:HTImage(@"haomabangding") WithTouchBlock:^(NSIndexPath *indexPath) {
                        
                        BaseDetailViewController *detail8 = [[BaseDetailViewController alloc] init];
                        detail8.title = @"绑定验证";
                        
                        [detail8 setImage:HTImage(@"kaihuxingmingyanzheng") WithTouchBlock:^(NSIndexPath *indexPath) {
                            
                            [weakSelf setAlerConten:@"恭喜您已获得穷游20里程,可以兑换穷游的礼品时使用" withLeftBtn:@"我知道了" rightBtn:nil];
                            [self refreshView:HTImage(@"yiqiandao")];
                            
                        }];
                        detail8.hidesBottomBarWhenPushed = YES;
                        [weakSelf.navigationController pushViewController:detail8 animated:YES];
                        
                        
                    }];
                    detail7.hidesBottomBarWhenPushed = YES;
                    [weakSelf.navigationController pushViewController:detail7 animated:YES];
                    
                    
                }];
                detail6.hidesBottomBarWhenPushed = YES;
                [weakSelf.navigationController pushViewController:detail6 animated:YES];
                
                
            }];
            detail5.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:detail5 animated:YES];
            
            
        }];
        detail4.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detail4 animated:YES];
        
    }];
    detail3.hidesBottomBarWhenPushed = YES;
    [weakSelf.navigationController pushViewController:detail3 animated:YES];
}

@end
