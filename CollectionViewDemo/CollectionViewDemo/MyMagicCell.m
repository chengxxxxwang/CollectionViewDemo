//
//  MyMagicCell.m
//  CollectionViewDemo
//
//  Created by chenxingwang on 16/5/4.
//  Copyright © 2016年 chenxingwang. All rights reserved.
//

#import "MyMagicCell.h"
#import "ACParallaxView.h"
#import <QuartzCore/QuartzCore.h>

@implementation MyMagicCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
//    self.myACParallaxView.parallax = YES;
//    self.myACParallaxView.parallaxDelegate = self;
//    self.myACParallaxView.refocusParallax = YES;
}

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.myACParallaxView.parallax = YES;
        self.myACParallaxView.parallaxDelegate = self;
        self.myACParallaxView.refocusParallax = YES;
        
    }
    
    return self;
}

#pragma mark - ACParallaxViewDelegate

- (void)parallaxView:(ACParallaxView*)parallaxView didChangeRelativeAttitude:(ACAttitude)attitude {
    self.myLabel.text = [NSString stringWithFormat:@"ACAttitude\nPitch: %f\nRoll: %f\nYaw: %f", attitude.pitch, attitude.roll, attitude.yaw];;
}


@end
