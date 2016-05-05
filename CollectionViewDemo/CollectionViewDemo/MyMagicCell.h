//
//  MyMagicCell.h
//  CollectionViewDemo
//
//  Created by chenxingwang on 16/5/4.
//  Copyright © 2016年 chenxingwang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ACParallaxView.h"


@interface MyMagicCell : UICollectionViewCell<ACParallaxViewDelegate>

@property (weak, nonatomic) IBOutlet ACParallaxView *myACParallaxView;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@end
