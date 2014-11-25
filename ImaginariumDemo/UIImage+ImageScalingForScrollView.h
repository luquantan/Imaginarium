//
//  UIImage+ImageScalingForScrollView.h
//  ImaginariumDemo
//
//  Created by LuQuan Intrepid on 11/25/14.
//  Copyright (c) 2014 LuQuan Intrepid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageScalingForScrollView)

- (CGSize)scaleImage:(UIImage *)image toSizeThatFits:(CGSize)sizeOfScrollView;


@end
