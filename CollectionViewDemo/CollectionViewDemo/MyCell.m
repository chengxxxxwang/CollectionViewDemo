//
//  MyCell.m
//  CollectionViewDemo
//
//  Created by chenxingwang on 16/5/4.
//  Copyright © 2016年 chenxingwang. All rights reserved.
//

#import "MyCell.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)

#define CellWidth 20

#define CellHeight 20

@implementation MyCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, (SCREEN_WIDTH - 0) / 2, (SCREEN_WIDTH - 0) / 2)];
        [self.imageView setUserInteractionEnabled:true];
        [self addSubview:self.imageView];
        self.descLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, (SCREEN_WIDTH - 20) / 4, (SCREEN_WIDTH - 20) / 2, 20)];
        self.descLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.descLabel];
    }
    return self;
}


@end
