//
//  WebViewController.m
//  Haobuzhushou
//
//  Created by Mr.Yan on 15/10/12.
//  Copyright © 2015年 Mr.Yan. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    [self.view addSubview:self.webView];
    
    
    
    
    
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://sdk.jiandanlicai.com/"]];
    [self.webView loadRequest:request];
    
    self.navigationController.navigationBarHidden = NO;

}

- (void)clickShutDown
{
    [self.delegate clickBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
