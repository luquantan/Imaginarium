//
//  ImaginariumWebService.h
//  ImaginariumDemo
//
//  Created by LuQuan Intrepid on 11/25/14.
//  Copyright (c) 2014 LuQuan Intrepid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImaginariumWebService : NSObject

+ (void)getImageWithName:(NSString *)imageName inBackgroundWithCompletion:(void(^)(UIImage *image, NSError *error))completionBlock;

@end
