//
//  HTTabBarController.m
//  iOSFinancial
//
//  Created by Mr.Yang on 15/3/27.
//  Copyright (c) 2015年 Mr.Yang. All rights reserved.
//

#import "HTTabBarController.h"
#import "HTNavigationController.h"
#import "FirstViewController.h"
#import "ViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
@interface HTTabBarController ()
{
    UIImageView *_imageView;
}
@property (nonatomic) UIButton *middlebtn;

@property (nonatomic) UIButton *homeTabarBtn;

@property (nonatomic) UIButton *findTabarBtn;

@property (nonatomic) UIButton *mySelfTabarBtn;

@end

@implementation HTTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tabBar.translucent = NO;
    
    self.viewControllers = [self subViewControllers];
    
    //  去掉顶部的阴影线
    self.tabBar.clipsToBounds = YES;
    
    [self changeShowdImageColor];
    
    [self providerTaBar];
    

}

- (void)providerTaBar
{
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, APPScreenWidth *.7, 60)];
    _imageView.userInteractionEnabled = YES;
    [self.tabBar addSubview:_imageView];
    
    self.homeTabarBtn.frame = CGRectMake(18, 8.25, 30, 30);
    self.homeTabarBtn.tag =1;
    [self.homeTabarBtn addTarget:self action:@selector(clickTabarBtnWithTag:) forControlEvents:UIControlEventTouchUpInside];
    [_imageView addSubview:self.homeTabarBtn];
    self.homeTabarBtn.selected = YES;
    
    self.findTabarBtn.frame = CGRectMake(85, 8.25, 30, 30);
    self.findTabarBtn.tag = 2;
    [self.findTabarBtn addTarget:self action:@selector(clickTabarBtnWithTag:) forControlEvents:UIControlEventTouchUpInside];
    [_imageView addSubview:self.findTabarBtn];
    
    self.mySelfTabarBtn.frame = CGRectMake(152, 8.25, 30, 30);
    self.mySelfTabarBtn.tag = 3;
    [self.mySelfTabarBtn addTarget:self action:@selector(clickTabarBtnWithTag:) forControlEvents:UIControlEventTouchUpInside];
    [_imageView addSubview:self.mySelfTabarBtn];
    
}

- (UIButton *)homeTabarBtn
{
    if (!_homeTabarBtn) {
        _homeTabarBtn = [[UIButton alloc]init];
        [_homeTabarBtn setImage:HTImage(@"home") forState:UIControlStateNormal];
        [_homeTabarBtn setImage:HTImage(@"homeH") forState:UIControlStateSelected];
    }
    return _homeTabarBtn;
}

- (UIButton *)findTabarBtn
{
    if (!_findTabarBtn) {
        _findTabarBtn = [[UIButton alloc]init];
        [_findTabarBtn setImage:HTImage(@"find") forState:UIControlStateNormal];
        [_findTabarBtn setImage:HTImage(@"findH") forState:UIControlStateSelected];
    }
    return _findTabarBtn;
}

- (UIButton *)mySelfTabarBtn
{
    if (!_mySelfTabarBtn) {
        _mySelfTabarBtn = [[UIButton alloc]init];
        [_mySelfTabarBtn setImage:HTImage(@"my") forState:UIControlStateNormal];
        [_mySelfTabarBtn setImage:HTImage(@"myH") forState:UIControlStateSelected];
    }
    return _mySelfTabarBtn;
}

- (void)clickTabarBtnWithTag:(UIButton *)sender
{
    if (self.homeTabarBtn.tag == sender.tag) {
        self.homeTabarBtn.selected = YES;
        self.findTabarBtn.selected = NO;
        self.mySelfTabarBtn.selected = NO;
        self.selectedIndex = 0;
    }
    if (self.findTabarBtn.tag == sender.tag) {
        self.homeTabarBtn.selected = NO;
        self.findTabarBtn.selected = YES;
        self.mySelfTabarBtn.selected = NO;
        self.selectedIndex = 1;
    }
    if (self.mySelfTabarBtn.tag == sender.tag) {
        self.homeTabarBtn.selected = NO;
        self.findTabarBtn.selected = NO;
        self.mySelfTabarBtn.selected = YES;
        self.selectedIndex = 2;
    }
    
}
- (void)setMiddleBtn
{
    [self.tabBar addSubview:self.middlebtn];
    [self.tabBar setBackgroundImage:HTImage(@"jingxuanhead1")];
}

- (UIButton *)middlebtn
{
    if (!_middlebtn) {
        _middlebtn =[[UIButton alloc]initWithFrame:CGRectMake(APPScreenWidth *.6, 0, APPScreenWidth*.4, 54)];
        [_middlebtn setImage:HTImage(@"jingxuanhead") forState:UIControlStateNormal];
        [_middlebtn setImage:HTImage(@"jingxuanhead") forState:UIControlStateHighlighted];
    }
    return _middlebtn;
}


//  改变阴影线颜色
- (void)changeShowdImageColor
{
    CGRect rect = CGRectMake(0, 0, APPScreenWidth, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,HTHexColor(0xefeeee).CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.tabBar setShadowImage:img];
    [self.tabBar setBackgroundImage:[[UIImage alloc]init]];
}
 
- (NSArray *)subViewControllers
{
    FirstViewController *store = [[FirstViewController alloc]init];
    store.tabBarItem = [self tabbarItemWithTitle:@"附近" andItemImage:@""];
    HTNavigationController *nav1 = [[HTNavigationController alloc] initWithRootViewController:store];
    nav1.isContentLight = YES;
    
    ViewController *cart = [[ViewController alloc]init];
    cart.tabBarItem = [self tabbarItemWithTitle:@"发现" andItemImage:@""];
    HTNavigationController *nav2 = [[HTNavigationController alloc] initWithRootViewController:cart];
    nav2.isContentLight = YES;
    
    ViewController1 *find = [[ViewController1 alloc]init];
    find.tabBarItem = [self tabbarItemWithTitle:@"服务" andItemImage:@""];
    find.btnFrame = CGRectMake(0, 60, APPScreenWidth, 200);
    HTNavigationController *nav3 = [[HTNavigationController alloc] initWithRootViewController:find];
    nav3.isContentLight = YES;
    
    ViewController2 *mySelf = [[ViewController2 alloc]init];
    mySelf.tabBarItem = [self tabbarItemWithTitle:@"我的" andItemImage:@""];
    HTNavigationController *nav4 = [[HTNavigationController alloc] initWithRootViewController:mySelf];
    
    ViewController3 *viewC31 = [[ViewController3 alloc]init];
    viewC31.tabBarItem = [self tabbarItemWithTitle:@"消息" andItemImage:@"message"];
    HTNavigationController *viewC3 = [[HTNavigationController alloc] initWithRootViewController:viewC31];

    return @[nav1, nav2, nav3,viewC3, nav4];
}

- (UITabBarItem *)tabbarItemWithTitle:(NSString *)title andItemImage:(NSString *)imageStr
{
//    UIImage *selectImage = HTImage(HTSTR(@"%@H", imageStr));
    UIImage *normalImage = HTImage(HTSTR(@"%@", imageStr));
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:normalImage selectedImage:nil];
    
    return tabBarItem;
}


@end
