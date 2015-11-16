//
//  CustomInvestGuideViewController.h
//  NoMoneyTravel
//
//  Created by Mr.Yang on 15/11/3.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "BaseDetailViewController.h"

@interface CustomInvestGuideViewController : BaseDetailViewController

@property (nonatomic, copy) NSString *step1AlertMsg;
@property (nonatomic, copy) NSString *step2AlertMsg;
@property (nonatomic, copy) NSString *step3AlertMsg;

@property (nonatomic, strong)   NSArray *step1AlertButtons;
@property (nonatomic, strong)   NSArray *step2AlertButtons;
@property (nonatomic, strong)   NSArray *step3AlertButtons;

@end
