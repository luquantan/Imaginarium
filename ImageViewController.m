//
//  ImageViewController.m
//  ImaginariumDemo
//
//  Created by LuQuan Intrepid on 11/24/14.
//  Copyright (c) 2014 LuQuan Intrepid. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIImage *image;
@end

@implementation ImageViewController
- (void)setScrollView:(UIScrollView *)scrollView
{
    _scrollView = scrollView;
    _scrollView.minimumZoomScale = 1.0;
    _scrollView.maximumZoomScale = 2.0;
    _scrollView.delegate = self;
    self.scrollView.contentSize = self.image ? self.image.size : CGSizeZero;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.scrollView.bounds];
        _imageView.backgroundColor = [UIColor yellowColor];
    }
    return _imageView;
}

- (void)setImageURL:(NSURL *)imageURL
{
    _imageURL = imageURL;
//    self.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.imageURL]];
    [self startDownloadingImage];
}

- (void)startDownloadingImage
{
    self.image = nil; //Remove the old image
    if (self.imageURL) {
        [self.activityIndicator startAnimating];
        NSURLRequest *request = [NSURLRequest requestWithURL:self.imageURL];
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
        NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
            if (!error) {
                if ([request.URL isEqual:self.imageURL]) {
                    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]]; //This does not need to be on the main thread because 1) UIImage is one of the few things that do not need to run on the main thread and 2) UIImage does not axctaully show anything on screen
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self.image = image;
                    });
                }
            }
        }];
        [task resume];
    }
}

//Method using property without InstanceVariable. Non @synthesize needed
- (UIImage *)image
{
    return self.imageView.image;
}

- (void)setImage:(UIImage *)image
{
    self.imageView.image = image;
    
    if (image) {
//        CGFloat maxWidth = CGRectGetWidth(self.scrollView.bounds);
//        CGFloat maxHeight = CGFLOAT_MAX;
//        [image sizeThatFits:CGSizeMake(maxWidth, <#CGFloat height#>)]
        CGFloat scale = image.size.height / image.size.width;
        CGFloat width = CGRectGetWidth(self.scrollView.bounds);
        CGFloat height = width * scale;
        self.imageView.frame = CGRectMake(0, 0, width, height);
        self.scrollView.contentSize = self.imageView.bounds.size;
    } else {
        self.scrollView.contentSize = CGSizeZero;
    }
    
    [self.activityIndicator stopAnimating];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.scrollView addSubview:self.imageView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.scrollView scrollRectToVisible:self.imageView.bounds animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
