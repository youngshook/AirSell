//
//  ASSmallCollectionViewController.m
//  AirSell
//
//  Created by YoungShook on 14-4-28.
//  Copyright (c) 2014年 qfpay. All rights reserved.
//

#import "ASSmallCollectionViewController.h"
#import "ASCollectionViewLargeLayout.h"

@interface ASSmallCollectionViewController ()

@property (nonatomic, assign) NSInteger slide;
@property (nonatomic, strong) UIView *mainView;
@property (nonatomic, strong) UIImageView *bottomImage;
@property (nonatomic, strong) UIImageView *reflected;
@property (nonatomic, strong) NSArray *galleryImages;

@end

@implementation ASSmallCollectionViewController

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = [self nextViewControllerAtPoint:CGPointZero];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UICollectionViewController *)nextViewControllerAtPoint:(CGPoint)point
{
    // We could have multiple section stacks and find the right one,
    ASCollectionViewLargeLayout *largeLayout = [[ASCollectionViewLargeLayout alloc] init];
    ASPaperCollectionViewController *nextCollectionViewController = [[ASPaperCollectionViewController alloc] initWithCollectionViewLayout:largeLayout];
    
    nextCollectionViewController.useLayoutToLayoutNavigationTransitions = YES;
    return nextCollectionViewController;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Gallery
    _galleryImages = @[@"image1", @"image2", @"image3", @"image4" ,@"image5",@"image6",@"image7",@"image8",@"image9",@"image10"];
    _slide = 0;
    
    
    // Init mainView
    _mainView = [[UIView alloc] initWithFrame:self.view.bounds];
    _mainView.clipsToBounds = YES;
    _mainView.layer.cornerRadius = 4;
    [self.view insertSubview:_mainView belowSubview:self.collectionView];
    
    // ImageView on top
    
    _reflected = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    _bottomImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(_reflected.bounds), 320, SCREEN_HEIGHT-320)];
    
    [_mainView addSubview:_reflected];
    [_mainView addSubview:_bottomImage];
    
    // Reflect imageView
    _reflected.transform = CGAffineTransformMakeScale(1.0, -1.0);
    
    
    // Gradient to top image
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = _bottomImage.bounds;
    gradient.colors = @[(id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4] CGColor],
                        (id)[[UIColor colorWithWhite:0 alpha:0] CGColor]];
    [_bottomImage.layer insertSublayer:gradient atIndex:0];
    
    
    // Gradient to reflected image
    CAGradientLayer *gradientReflected = [CAGradientLayer layer];
    gradientReflected.frame = _reflected.bounds;
    gradientReflected.colors = @[(id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:1] CGColor],
                                 (id)[[UIColor colorWithWhite:0 alpha:0] CGColor]];
    [gradientReflected setAffineTransform:CGAffineTransformMakeScale(1.0, -1.0)];
    [_reflected.layer insertSublayer:gradientReflected atIndex:0];
    
    
    // First Load
    [self changeSlide];
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:4.0f target:self selector:@selector(changeSlide) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

#pragma mark - Change slider
- (void)changeSlide
{
    //    if (_fullscreen == NO && _transitioning == NO) {
    if(_slide > _galleryImages.count-1) _slide = 0;
    
    UIImage *toImage = [UIImage imageNamed:_galleryImages[_slide]];
    [UIView transitionWithView:_mainView
                      duration:0.6f
                       options:UIViewAnimationOptionTransitionCrossDissolve | UIViewAnimationCurveEaseInOut
                    animations:^{
                        _bottomImage.image = toImage;
                        _reflected.image = toImage;
                    } completion:nil];
    _slide++;
    //    }
}

@end
