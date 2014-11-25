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
            ivc.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://images.apple.com/v/iphone-5s/gallery/a/images/download/%@.jpg", segue.identifier]];
        } else {
            NSArray *otherPhotos = @[@"4",@"5",@"6"];
            ivc.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://images.apple.com/v/iphone-5s/gallery/a/images/download/photo_%@.jpg", otherPhotos[arc4random_uniform(2)]]];
        }
        
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
