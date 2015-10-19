//
//  WebViewController.h
//  Haobuzhushou
//
//  Created by Mr.Yan on 15/10/12.
//  Copyright © 2015年 Mr.Yan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  WebViewControllerDelegate<NSObject>

- (void)clickBtn;

@end

@interface WebViewController : UIViewController

@property (nonatomic,assign) id <WebViewControllerDelegate>delegate;

@property(strong, nonatomic) UIWebView * webView;

@end
