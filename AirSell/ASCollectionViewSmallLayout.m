//
//  ASCollectionViewSmallLayout.h
//  AirSell
//
//  Created by YoungShook on 14-4-28.
//  Copyright (c) 2014年 qfpay. All rights reserved.
//

#import "ASCollectionViewSmallLayout.h"

@implementation ASCollectionViewSmallLayout

- (id)init
{
    if (!(self = [super init])) return nil;
    self.itemSize = CGSizeMake(180, 320);
    self.sectionInset = UIEdgeInsetsMake(0, 2, SCREEN_HEIGHT-320, 2);
    self.minimumInteritemSpacing = 10.0f;
    self.minimumLineSpacing = 2.0f;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return self;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds
{
    return NO;
}

@end
