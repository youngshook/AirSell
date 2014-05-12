//
//  ASPaperCollectionViewController.m
//  AirSell
//
//  Created by YoungShook on 14-4-28.
//  Copyright (c) 2014年 qfpay. All rights reserved.
//

#import "ASPaperCollectionViewController.h"
#import "ASTransitionLayout.h"

#define MAX_COUNT 12
#define CELL_ID @"CELL_ID"

@interface ASPaperCollectionViewController ()
@property (nonatomic,strong)NSArray *collectionIconArray;
@property (nonatomic,strong)NSArray *collectionColorArray;
@property (nonatomic,strong)UIWebView *webview;
@end

@implementation ASPaperCollectionViewController

- (id)initWithCollectionViewLayout:(UICollectionViewFlowLayout *)layout
{
    if (self = [super initWithCollectionViewLayout:layout])
        {
        self.collectionIconArray = @[@"add",@"manage_order",@"manage_shop",@"stats",@"myincome",@"forum",@"weixin_payment",@"promotions",@"qpos",@"miaopos",@"miaomember",@"qianbao"];
        self.collectionColorArray = @[RGBACOLOR(253,122,153,0.92),RGBACOLOR(76,208,236,0.92),RGBACOLOR(134,150,250,0.92),RGBACOLOR(255,177,143,0.92),RGBACOLOR(57,227,201,0.92),RGBACOLOR(114,207,255,0.92),RGBACOLOR(245,132,206,0.92),RGBACOLOR(103,174,254,0.92),RGBACOLOR(79, 149, 209, 0.92),RGBACOLOR(255, 132, 158, 0.92),RGBACOLOR(209, 79, 168, 0.92),RGBACOLOR(132, 190, 255, 0.92)];
        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CELL_ID];
        [self.collectionView setBackgroundColor:[UIColor clearColor]];
        }
    return self;
}

#pragma mark - Hide StatusBar
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_ID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.layer.cornerRadius = 4;
    cell.clipsToBounds = YES;
    
    UIImageView *backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[self.collectionIconArray objectAtIndex:indexPath.row]]];
    backgroundView.backgroundColor = [self.collectionColorArray objectAtIndex:indexPath.row];
    backgroundView.contentMode = UIViewContentModeCenter;
    cell.backgroundView = backgroundView;
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return MAX_COUNT;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(UICollectionViewController*)nextViewControllerAtPoint:(CGPoint)point
{
    return nil;
}

- (UICollectionViewTransitionLayout *)collectionView:(UICollectionView *)collectionView
                        transitionLayoutForOldLayout:(UICollectionViewLayout *)fromLayout newLayout:(UICollectionViewLayout *)toLayout
{
    ASTransitionLayout *transitionLayout = [[ASTransitionLayout alloc] initWithCurrentLayout:fromLayout nextLayout:toLayout];
    return transitionLayout;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // Adjust scrollView decelerationRate
    self.collectionView.decelerationRate = self.class != [ASPaperCollectionViewController class] ? UIScrollViewDecelerationRateNormal : UIScrollViewDecelerationRateFast;
    

}


@end
