//
//  NSObject+ImageScaling.h
//  ImaginariumDemo
//
//  Created by LuQuan Intrepid on 11/25/14.
//  Copyright (c) 2014 LuQuan Intrepid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (ImageScaling)

- (CGSize)scaleImage:(UIImage *)image toSizeThatFits:(CGSize)sizeOfScrollView;

@end
