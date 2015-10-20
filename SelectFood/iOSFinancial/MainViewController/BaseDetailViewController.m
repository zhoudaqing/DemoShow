//
//  BaseDetailViewController.m
//  FreshLife
//
//  Created by Mr.Yang on 15/10/15.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "BaseDetailViewController.h"
#import "ContentCell.h"


@interface BaseDetailViewController ()

@end

@implementation BaseDetailViewController

- (void)setImage:(UIImage *)image WithTouchBlock:(void (^)(NSIndexPath *))touchBlock
{
    self.contentImage = image;
    self.cellToucheBlock = touchBlock;
}

- (void)setBackImage:(UIImage *)image WithTouchBlock:(void (^)(NSIndexPath *))TouchBlock
{
    UIImageView *backImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, APPScreenWidth, APPScreenHeight)];
    [backImage setImage:HTImage(@"shouyeBack")];
    [self.view addSubview:backImage];
    self.contentImage = [UIImage imageNamed:@""];
    self.cellToucheBlock = TouchBlock;
}

#pragma mark -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.contentImage.size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContentCell *cell = nil;
    
    cell = [[ContentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.contentImageView.image = self.contentImage;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_cellToucheBlock) {
        _cellToucheBlock(indexPath);
    }
}


@end
