//
//  BaseDetailViewController.h
//  FreshLife
//
//  Created by Mr.Yang on 15/10/15.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "HTBaseTableViewController.h"

@interface BaseDetailViewController : HTBaseTableViewController

@property (nonatomic, strong)   UIImage *contentImage;

@property (nonatomic, copy) void(^viewDidLoadBlock)(UIViewController *viewController
);

@property (nonatomic, copy) void(^cellToucheBlock)(NSIndexPath *indexPath);

@property (nonatomic,assign) BOOL isRecharge;

@property (nonatomic,copy) NSString *alertContent;

@property (nonatomic,assign) BOOL isHidnBar;

@property (nonatomic,assign) BOOL isOpen;

- (void)setImage:(UIImage *)image WithTouchBlock:(void (^)(NSIndexPath *indexPath))cellTouchBlock;

- (void)setBackImage:(UIImage *)image WithTouchBlock:(void (^)(NSIndexPath *indexPath ))TouchBlock;

- (void)setAlerConten:(NSString *)conten withLeftBtn:(NSString *)leftTitle rightBtn:(NSString *)rightTitle;

- (void)refreshView:(UIImage *)image;

- (void)returnBackRootView:(UIViewController *)vc;

@end
