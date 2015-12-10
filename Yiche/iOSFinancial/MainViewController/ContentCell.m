//
//  ContentCell.m
//  FreshLife
//
//  Created by Mr.Yang on 15/10/14.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "ContentCell.h"


@implementation ContentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] init];
        _contentImageView = imageView;
        _contentImageView.frame = self.bounds;
        
        self.backgroundView = imageView;
        
    }

    return self;
}

@end
