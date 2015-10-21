//
//  Shouye1ViewController.m
//  SelectFood
//
//  Created by Mr.Yan on 15/10/20.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "Shouye1ViewController.h"
#import "ZhuanPanViewController.h"
#import "PaySuccessfulViewController.h"

@interface Shouye1ViewController ()
{
    UIImageView *_backImage;
}
@property (nonatomic)UITapGestureRecognizer *tap;

@end

@implementation Shouye1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = NO;
    
    self.title = @"纯然火锅";
    
    _backImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, APPScreenWidth, APPScreenHeight - 40)];
    [_backImage setImage:HTImage(@"shouye1")];
    [self.view addSubview:_backImage];
    _backImage.userInteractionEnabled = YES;
    [_backImage addGestureRecognizer:self.tap];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tongzhi) name:@"huodongtongzhi" object:nil];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(252, APPScreenHeight - 90, 120, 44)];
    [btn addTarget:self action:@selector(paySucessFull) forControlEvents:UIControlEventTouchUpInside];
    [_backImage addSubview:btn];

}

- (UITapGestureRecognizer *)tap
{
    if (!_tap) {
        _tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showgoodsList)];
    }
    return _tap;
}

-(void)showgoodsList
{
    ZhuanPanViewController *shouye1 = [[ZhuanPanViewController alloc]init];
    shouye1.hidesBottomBarWhenPushed  = YES;
    [self.navigationController pushViewController:shouye1 animated:YES];
}

- (void)tongzhi
{
    [_backImage setImage:HTImage(@"yijinglingqu")];
    [self.tap removeTarget:self action:@selector(showgoodsList)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)paySucessFull
{
    PaySuccessfulViewController *pays= [[PaySuccessfulViewController alloc]init];
    [self.navigationController pushViewController:pays animated:YES];
}



@end
