//
//  InvestViewController.h
//  FreshLife
//
//  Created by Mr.Yang on 15/10/16.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "BaseDetailViewController.h"

@interface InvestViewController : BaseDetailViewController

//是否直接进入购买页面
@property (nonatomic, assign) BOOL isBuy;

@property (nonatomic, copy) NSString *notciceStr;

@end
