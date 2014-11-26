//
//  ViewController.m
//  ImaginariumDemo
//
//  Created by LuQuan Intrepid on 11/24/14.
//  Copyright (c) 2014 LuQuan Intrepid. All rights reserved.
//

#import "ViewController.h"
#import "ImageViewController.h"

static NSString * const LQImageDownloadBaseURL = @"http://images.apple.com/v/iphone-5s/gallery/a/images/download/";

@interface ViewController ()

@end

@implementation ViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[ImageViewController class]]) {
        ImageViewController *ivc = (ImageViewController *)segue.destinationViewController;
        ivc.title = segue.identifier;
        
        if (![segue.identifier isEqualToString:[NSString stringWithFormat:@"randomPhoto"]]) {
            ivc.imageName = [NSString stringWithFormat:@"%@.jpg", segue.identifier];
        } else {
            NSArray *otherPhotos = @[@"4",@"5",@"6"];
            ivc.imageName = [NSString stringWithFormat:@"photo_%@.jpg", otherPhotos[arc4random_uniform(2)]];
        }
        
    }
}

@end
