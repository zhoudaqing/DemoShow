//
//  MineViewController.m
//  XianLife
//
//  Created by Mr.Yan on 15/10/13.
//  Copyright © 2015年 Mr.Yan. All rights reserved.
//

#import "MyStoreViewController.h"
#import "FanyingbiliViewController.h"
#import "BaseDetailViewController.h"
#import "GunayudianpuViewController.h"
#import "ShengjidianpuViewController.h"
#import "CloudTabbarController.h"

@interface MyStoreViewController ()<UINavigationControllerDelegate>
{
    UIImageView *_backImage, *_passView;
}

@end

@implementation MyStoreViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.isStyleLight = YES;
    
    [self.navigationController.navigationBar setBarTintColor:HTWhiteColor];
    [self.navigationController.navigationBar setTintColor:[UIColor jt_barTintColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor],NSFontAttributeName : [UIFont systemFontOfSize:18]}];
    
    self.navigationController.navigationBarHidden = YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView removeFromSuperview];
    _backImage = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [_backImage setImage:[UIImage imageNamed:@"wodedian.PNG"]];
    [self.view addSubview:_backImage];
    _backImage.userInteractionEnabled = YES;
    
    [self addsubViews];
}

- (void)addsubViews
{
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(20, 251, 120, 20)];
    lable.textColor = [UIColor whiteColor];
    lable.text = @"";
    lable.font = [UIFont systemFontOfSize:13.0];
    [_backImage addSubview:lable];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(lable.right - 20, lable.origin.y - 5, 80, 20)];
    [btn setTitle:@"" forState:UIControlStateNormal];
    [_backImage addSubview:btn];
    
    [btn addTarget:self action:@selector(pushYanshiDemo1) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *aboutBtn = [[UIButton alloc]initWithFrame:CGRectMake(lable.right + 60, lable.origin.y - 5, 80, 20)];
    [aboutBtn setTitle:@"" forState:UIControlStateNormal];
    [_backImage addSubview:aboutBtn];
    [aboutBtn addTarget:self action:@selector(pushYanshiDemo) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *middleImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 344, self.view.width, 200)];
    [middleImage setImage:[UIImage imageNamed:@"wodedian1"]];
    [self.view addSubview:middleImage];
    middleImage.userInteractionEnabled = YES;
    
    UIButton *inviteManage = [[UIButton alloc]initWithFrame:CGRectMake(156, 100, 80, 80)];
    [inviteManage addTarget:self action:@selector(inviteManage) forControlEvents:UIControlEventTouchUpInside];
    [middleImage addSubview:inviteManage];
    
    UIButton *myIncome = [[UIButton alloc]initWithFrame:CGRectMake(266, 100, 80, 80)];
    [myIncome addTarget:self action:@selector(myIncome) forControlEvents:UIControlEventTouchUpInside];
    [middleImage addSubview:myIncome];
    
    UIButton *btn4 = [[UIButton alloc]initWithFrame:CGRectMake(lable.right + 146, lable.origin.y - 120, 80, 20)];
    [btn4 setTitle:@"" forState:UIControlStateNormal];
    [_backImage addSubview:btn4];
    
    [btn4 addTarget:self action:@selector(pushYanshiDemoC) forControlEvents:UIControlEventTouchUpInside];
    
   
    
}

- (void)myIncome
{
    __weakSelf;
    BaseDetailViewController *update = [[BaseDetailViewController alloc] init];
    update.title = @"我的收入";
    __weak BaseDetailViewController *wakeBsae = update;
    [update setImage:HTImage(@"dianpushengji") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        BaseDetailViewController *Activity = [[BaseDetailViewController alloc] init];
        Activity.title = @"鲜life金融活动说明";
        [Activity setImage:HTImage(@"dianpushengji") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            BaseDetailViewController *NameService = [[BaseDetailViewController alloc] init];
            NameService.title = @"姓名电话绑定";
            [NameService setImage:HTImage(@"dianpushengji") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                BaseDetailViewController *bankCardService = [[BaseDetailViewController alloc] init];
                bankCardService.title = @"银行卡绑定";
                [bankCardService setImage:HTImage(@"dianpushengji") WithTouchBlock:^(NSIndexPath *indexPath) {
                    
                    [weakSelf setAlerConten:@"恭喜您已获得减免提现手续费特权1次，仅供下次提现时使用~" withLeftBtn:nil rightBtn:@"我知道了" isPush:YES];
                    [wakeBsae refreshView:HTImage(@"")];
                }];
                
                [weakSelf.navigationController pushViewController:bankCardService animated:YES];
                
                
            }];
            
            [weakSelf.navigationController pushViewController:NameService animated:YES];
            
        }];
        
        [weakSelf.navigationController pushViewController:Activity animated:YES];
        
        
    }];
    
    update.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:update animated:YES];}

- (void)inviteManage
{
    __weakSelf;
    BaseDetailViewController *update = [[BaseDetailViewController alloc] init];
    update.title = @"邀请管理";
    __weak BaseDetailViewController *wakeBsae = update;
    [update setImage:HTImage(@"dianpushengji") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        BaseDetailViewController *Activity = [[BaseDetailViewController alloc] init];
        Activity.title = @"鲜life金融活动说明";
        [Activity setImage:HTImage(@"dianpushengji") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            BaseDetailViewController *NameService = [[BaseDetailViewController alloc] init];
            NameService.title = @"姓名电话绑定";
            [NameService setImage:HTImage(@"dianpushengji") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                BaseDetailViewController *bankCardService = [[BaseDetailViewController alloc] init];
                bankCardService.title = @"银行卡绑定";
                [bankCardService setImage:HTImage(@"dianpushengji") WithTouchBlock:^(NSIndexPath *indexPath) {
                    
                    [weakSelf setAlerConten:@"恭喜您已获得鲜life5元现金券，可供在鲜life购买商品时抵现金使用~" withLeftBtn:nil rightBtn:@"我知道了" isPush:YES];
                    [wakeBsae refreshView:HTImage(@"")];
                }];
                
                [weakSelf.navigationController pushViewController:bankCardService animated:YES];

                
            }];
            
            [weakSelf.navigationController pushViewController:NameService animated:YES];
            
        }];
        
        [weakSelf.navigationController pushViewController:Activity animated:YES];

        
    }];
    
    update.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:update animated:YES];
}

- (void)pushYanshiDemo
{
    __weakSelf;
    BaseDetailViewController *update = [[BaseDetailViewController alloc] init];
    update.title = @"关于升级店铺";
    [update setImage:HTImage(@"dianpushengji") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        CloudTabbarController *VC = [[CloudTabbarController alloc]init];
        VC.selectedIndex = 1;
        VC.showType = ShowTypeInvest;
        VC.actionPrompt = @"恭喜您，您已获得鲜Life赠送的10个货架，可在『我的店』里使用";
        [weakSelf.navigationController presentViewController:VC animated:YES completion:^{
            [self.navigationController popToRootViewControllerAnimated:NO];
        }];
        
    }];
    
    update.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:update animated:YES];
    
}

- (void)pushYanshiDemo1
{
    GunayudianpuViewController *vc = [[GunayudianpuViewController alloc]init];
    
    [vc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:vc animated:YES];
    
}


- (void)pushYanshiDemoC
{

    CloudTabbarController *VC = [[CloudTabbarController alloc]init];
    [VC showPromptView];
    [self.navigationController presentViewController:VC animated:YES completion:nil];

}


- (void)showTabar
{
    CloudTabbarController *VC = [[CloudTabbarController alloc]init];
    [self.navigationController presentViewController:VC animated:YES completion:nil];
    
    [self performSelector:@selector(dissPassView) withObject:nil afterDelay:1.5f];
}

- (void)dissPassView
{
    [_passView removeFromSuperview];

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

@end
