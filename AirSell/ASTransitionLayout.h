//
//  ASTransitionLayout.h
//  AirSell
//
//  Created by YoungShook on 14-4-28.
//  Copyright (c) 2014年 qfpay. All rights reserved.
//

@import UIKit;

@interface ASTransitionLayout : UICollectionViewTransitionLayout

@property (nonatomic) UIOffset offset;
@property (nonatomic) CGFloat progress;
@property (nonatomic) CGSize itemSize;

@end
