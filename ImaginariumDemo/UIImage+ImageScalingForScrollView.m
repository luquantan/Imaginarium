//
//  UIImage+ImageScalingForScrollView.m
//  ImaginariumDemo
//
//  Created by LuQuan Intrepid on 11/25/14.
//  Copyright (c) 2014 LuQuan Intrepid. All rights reserved.
//

#import "UIImage+ImageScalingForScrollView.h"

@implementation UIImage (ImageScalingForScrollView)

- (CGSize)scaleImage:(UIImage *)image toSizeThatFits:(CGSize)sizeOfScrollView
{
    CGSize sizeThatFits = CGSizeZero;
    
    CGFloat scale = image.size.height / image.size.width;
    CGFloat widthThatFits = sizeOfScrollView.width;
    CGFloat heightThatFits = scale * widthThatFits;
    
    sizeThatFits = CGSizeMake(widthThatFits, heightThatFits);
    
    return sizeThatFits;
}


@end
