//
//  VRPlayerVC.m
//  CollectionViewDemo
//
//  Created by chenxingwang on 16/5/4.
//  Copyright © 2016年 chenxingwang. All rights reserved.
//

#import "VRPlayerVC.h"
#import <UtoVRPlayer/UtoVRPlayer.h>

@interface VRPlayerVC ()<UVPlayerDelegate>

@property (nonatomic , strong) UVPlayer *player;

@end

@implementation VRPlayerVC

#pragma mark - Getters
-(UVPlayer *)player {
    if (_player == nil) {
        _player = [[UVPlayer alloc] initWithConfiguration:nil];
        _player.delegate = self;
    }
    return _player;
}

-(NSMutableArray *)itemsToPlay {
    if (_itemsToPlay == nil) {
        _itemsToPlay = [[NSMutableArray alloc]init];
    }
    return _itemsToPlay;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"播放器";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //将播放视图添加到当前界面
    [self.view addSubview:self.player.playerView];
    
    if (self.player.viewStyle == UVPlayerViewStyleDefault) {
        //默认界面。设置竖屏返回按钮动作
        [self.player setPortraitBackButtonTarget:self selector:@selector(back:)];
    }
    
    //把要播放的内容添加到播放器
    [self.player appendItems:self.itemsToPlay];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self navigatonHidhen];
    });
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    //调整frame。你可以使用任何其它布局方式保证播放视图是你期望的大小
    CGRect frame;
    if (self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
        frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    } else {
        frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 0);
    }
    self.player.playerView.frame = frame;
    
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //退出时不要忘记调用prepareToRelease
    [self.player prepareToRelease];
}

#pragma mark - Helper

-(void)back:(UIButton*)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"你好" message:@"你可以点击我完成退出页面等操作" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:confirm];
    [self presentViewController:alert animated:YES completion:nil];
    
    [self navigationShown];
    
}

#pragma mark - PanoPlayerDelegate
-(void)player:(UVPlayer *)player willBeginPlayItem:(UVPlayerItem *)item {
    if (player.viewStyle == UVPlayerViewStyleDefault) {
        //设置横屏显示的title为当前播放资源的路径。你可以设置为其它的任何内容
        [player setTitleText:item.path];
    }
}

- (void)navigatonHidhen{

    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
}

- (void)navigationShown{

    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
