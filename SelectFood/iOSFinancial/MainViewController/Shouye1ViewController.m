//
//  Shouye1ViewController.m
//  SelectFood
//
//  Created by Mr.Yan on 15/10/20.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "Shouye1ViewController.h"
#import "ZhuanPanViewController.h"


@interface Shouye1ViewController ()

@property (nonatomic)UITapGestureRecognizer *tap;

@end

@implementation Shouye1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor orangeColor],NSFontAttributeName : [UIFont systemFontOfSize:18]};
    
    self.title = @"纯然火锅";
    
    UIImageView *backImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, APPScreenWidth, APPScreenHeight)];
    [backImage setImage:HTImage(@"shouye1")];
    [self.view addSubview:backImage];
    backImage.userInteractionEnabled = YES;
    [backImage addGestureRecognizer:self.tap];

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



@end
