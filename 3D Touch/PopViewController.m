//
//  PopViewController.m
//  3D Touch
//
//  Created by 吴瀚波 on 15/10/12.
//  Copyright © 2015年 tmall. All rights reserved.
//

#import "PopViewController.h"

@interface PopViewController()

@property (nonatomic, strong) UITapGestureRecognizer *tap;

@end

@implementation PopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = [UIImage imageNamed:@"img"];
    [self.view addSubview:imageView];
    [self.view addGestureRecognizer:self.tap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UITapGestureRecognizer *)tap
{
    if (!_tap) {
        _tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
    }
    return _tap;
}

@end
