//
//  ViewController.m
//  CollectionViewDemo
//
//  Created by chenxingwang on 16/5/4.
//  Copyright © 2016年 chenxingwang. All rights reserved.
//



#import "ViewController.h"
#import "MyCell.h"
#import "MyMagicCell.h"
#import "VRPlayerVC.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define KisSystemVdersionBlowiOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0)
 

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

{

    /**定义collectionView*/
    UICollectionView *myCollectionView;

    /**存放图片*/
    NSMutableArray *images;
    
    /**本地路径*/
    NSString *localPath;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    
//
    
    if (KisSystemVdersionBlowiOS8) {
        
        NSLog(@"版本不支持");
        
    }
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self readPictures];
    
    [self layoutCollectionView];
    
}


/**获取图片*/
- (void) readPictures{

    self->images = [NSMutableArray array];
    
    for (int i = 0; i < 12; i ++) {
        
        [self->images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"image%03d.jpg",i]]];
        
    }
    
}

- (NSString *)localPath {
    
    if (localPath == nil) {
        localPath = [[NSBundle mainBundle] pathForResource:@"L2_1920_3_25" ofType:@"mp4"];
    }
    return localPath;
}

/**布局collectionView*/
- (void) layoutCollectionView{

    /**设置 flowlayout*/
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];

    myCollectionView = [[UICollectionView alloc] initWithFrame:[[UIScreen mainScreen] bounds] collectionViewLayout:flowLayout];
    
    [myCollectionView setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:myCollectionView];
    
    myCollectionView.dataSource = self;
    myCollectionView.delegate = self;
    
    [myCollectionView registerClass:[MyCell class] forCellWithReuseIdentifier:@"MyCell"];

    [myCollectionView registerNib:[UINib nibWithNibName:@"MyMagicCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"MyMagicCell"];
}

#pragma mark -
#pragma mark - UICollectionViewDataSource,UICollectionViewDelegate
#pragma mark -

/**定义cell 数量*/
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return images.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    MyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCell" forIndexPath:indexPath];
    
    cell.imageView.image = [images objectAtIndex:indexPath.row];
    cell.descLabel.text = [NSString stringWithFormat:@"美景%ld",(long)indexPath.row + 1];
    
    return cell;
    
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake((SCREEN_WIDTH - 10) / 2, (SCREEN_WIDTH - 10) / 2 + 2);
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    return CGSizeMake(300, 0);
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    UVPlayerViewStyle style = UVPlayerViewStyleDefault;
    style = UVPlayerViewStyleDefault;
    
    VRPlayerVC *playerVC = [VRPlayerVC new];
    NSMutableArray *items = [NSMutableArray array];
    
    //播放一个本地视频
    UVPlayerItem *item = [[UVPlayerItem alloc] initWithPath:self.localPath type:UVPlayerItemTypeLocalVideo];
    [items addObject:item];
    [playerVC.itemsToPlay addObjectsFromArray:items];
    
    [self.navigationController pushViewController:playerVC animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
