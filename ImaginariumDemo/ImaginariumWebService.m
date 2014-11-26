//
//  ImaginariumWebService.m
//  ImaginariumDemo
//
//  Created by LuQuan Intrepid on 11/25/14.
//  Copyright (c) 2014 LuQuan Intrepid. All rights reserved.
//

#import "ImaginariumWebService.h"

static NSString * const LQImageDownloadBaseURL = @"http://images.apple.com/v/iphone-5s/gallery/a/images/download/";

@implementation ImaginariumWebService

+ (void)getImageWithName:(NSString *)imageName inBackgroundWithCompletion:(void(^)(UIImage *image, NSError *error))completionBlock
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",LQImageDownloadBaseURL,imageName]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        UIImage *image;
        if (!error) {
            image = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completionBlock) completionBlock(image, error);
        });
    }];
    [task resume];
}

@end
