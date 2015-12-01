//
//  RandianWeixin.m
//  Randian
//
//  Created by Mr.Yan on 15/11/29.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "RandianWeixin.h"
#import "CloudTabbarController.h"

@interface RandianWeixin ()
{
    UIImageView *_imageView;
    UIButton *_imageBtn;
    BOOL *_isget;
}
@end

@implementation RandianWeixin

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:HTImage(@"Randian")];
    [self.view addSubview:imageView];
    UIButton *btrn = [[UIButton alloc]initWithFrame:CGRectMake(42, APPScreenHeight - 28, (APPScreenWidth -42)/3, 48)];
    [btrn addTarget:self action:@selector(yuyuejiaolian) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btrn];
    
    UIButton *btrn1 = [[UIButton alloc]initWithFrame:CGRectMake(42 + (APPScreenWidth -42)/3, APPScreenHeight - 28, (APPScreenWidth -42)/3, 48)];
    [btrn1 addTarget:self action:@selector(popover:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btrn1];
    
    UIButton *btrn2 = [[UIButton alloc]initWithFrame:CGRectMake(42 + (APPScreenWidth -42)/3*2, APPScreenHeight - 28, (APPScreenWidth -42)/3, 48)];
    [btrn2 addTarget:self action:@selector(popover1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btrn2];
    

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
}

- (void)yuyuejiaolian
{
    self.navigationController.navigationBar.hidden = NO;

    [self.navigationController presentViewController:self.tabBarController animated:NO completion:^{
        
    }];
    [_imageView  removeFromSuperview];
}

-(void)popover:(id)sender
{
    UIButton *btn = sender;
    if (btn.selected == YES) {
        [_imageView removeFromSuperview];
        btn.selected = NO;
    }else{
    btn.selected = YES;
        if (_isget) {
            _imageView = [[UIImageView alloc]initWithImage:HTImage(@"caidanback")];
            [self.view addSubview:_imageView];
            _imageBtn = [[UIButton alloc]initWithFrame:_imageView.bounds];
            _imageView.userInteractionEnabled = YES;
            [_imageView addSubview:_imageBtn];
            [_imageBtn addTarget:self action:@selector(clickImageBtn) forControlEvents:UIControlEventTouchUpInside];


        }else
        {
            _imageView = [[UIImageView alloc]initWithImage:HTImage(@"caidan")];

            [self.view addSubview:_imageView];
        _imageBtn = [[UIButton alloc]initWithFrame:_imageView.bounds];
        _imageView.userInteractionEnabled = YES;
        [_imageView addSubview:_imageBtn];
        [_imageBtn addTarget:self action:@selector(clickImageBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    }
    _imageView.frame = CGRectMake(btn.origin.x+(btn.width -_imageView.width)/2, self.view.height- _imageView.height - btn.height-4,_imageView.width, _imageView.height);
}

-(void)popover1:(id)sender
{
    [_imageView  removeFromSuperview];
}

- (void)clickImageBtn
{
    if (_isget) {
        
    }else
    {
        __weakSelf;
        BaseDetailViewController *detail5 = [[BaseDetailViewController alloc] init];
        detail5.title = @"免费健身喽";
        [detail5 setImage:HTImage(@"dafangsong") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            CloudTabbarController *VC = [[CloudTabbarController alloc]init];
            [VC changeMessageWith:@"恭喜您已获得燃点健身体验券，快去免费体验吧"];
            VC.selectedIndex = 1;
            [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];
            [weakSelf.navigationController popToViewController:weakSelf.navigationController.viewControllers[0] animated:NO];
            _isget = YES;
            [_imageView removeFromSuperview];
            _imageBtn.selected = NO;
        }];
        detail5.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detail5 animated:YES];

    }
}

- (HTTabBarController *)tabBarController
{
    if (!_tabBarController) {
        _tabBarController = [[HTTabBarController alloc] init];
        _tabBarController.title = @"燃点";
    }
    
    return _tabBarController;
}

- (void)closeTabBar
{
    [self dismissViewController];
}


@end
