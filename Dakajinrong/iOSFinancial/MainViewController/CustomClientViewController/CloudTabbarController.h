//
//  CloudTabbarController.h
//  FreshLife
//
//  Created by Mr.Yang on 15/10/16.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "HTTabBarController.h"

typedef NS_ENUM(NSInteger, ShowType) {
    
    //  正常理财
    ShowTypeNormal,
    
    //  投资
    ShowTypeInvest,
    
    //  验证真实姓名
    ShowTypeValidateName,
    
    //  绑定卡
    ShowTypeBindCard
    
};

@interface CloudTabbarController : HTTabBarController


@property (nonatomic, assign) BOOL isLogin;

//  活动的图片
@property (nonatomic, strong)   UIImage *actionImage;
@property (nonatomic, assign)   ShowType showType;

//  投资或者验证成功之后的广告语
@property (nonatomic, copy) NSString *actionPrompt;

//  是否弹出云账户介绍页
@property (nonatomic, assign) BOOL isPromptShowed;

//是否直接进入购买页面
@property (nonatomic, assign) BOOL isBuy;

@property (nonatomic, copy) NSString *notciceStr;


- (void)refreshView;

- (void)showPromptView;

- (void)changeMessageWith:(NSString *)message;


@end
