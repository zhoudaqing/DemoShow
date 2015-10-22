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

@property (nonatomic, copy) void(^cellToucheBlock)(NSIndexPath *indexPath);

- (void)setImage:(UIImage *)image WithTouchBlock:(void (^)(NSIndexPath *indexPath))cellTouchBlock;

- (void)setImageBaoyouhuodong:(UIImage *)image;

- (void)setAlerConten:(NSString *)conten withLeftBtn:(NSString *)leftTitle rightBtn:(NSString *)rightTitle isPush:(BOOL)ispu;

- (void)shouquanWith:(NSString *)content;

@end
