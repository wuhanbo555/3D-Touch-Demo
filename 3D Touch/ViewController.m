//
//  ViewController.m
//  3D Touch
//
//  Created by 吴瀚波 on 15/10/9.
//  Copyright © 2015年 tmall. All rights reserved.
//

#import "ViewController.h"
#import "3D_UITouch.h"
#import "PeekViewController.h"
#import "PopViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UILabel *label;

@end

@implementation ViewController


- (void)check3DTouch
{
    // 如果开启了3D touch
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
    {
        [self registerForPreviewingWithDelegate:(id)self sourceView:_label];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _D_UITouch *view = [[_D_UITouch alloc] initWithFrame:CGRectMake(10, 30, self.view.frame.size.width - 20, 100)];
    [self.view addSubview:view];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(10, 300, self.view.frame.size.width - 20, 100)];
    _label.userInteractionEnabled = YES;
    _label.textAlignment = NSTextAlignmentCenter;
    _label.backgroundColor = [UIColor yellowColor];
    _label.font = [UIFont boldSystemFontOfSize:20];
    _label.text = @"Peek && Pop";
    [self.view addSubview:_label];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self check3DTouch];
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection
{
    [self check3DTouch];
}

- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    //防止重复加入
    if ([self.presentedViewController isKindOfClass:[PeekViewController class]])
    {
        return nil;
    }
    else
    {
        PeekViewController *peekViewController = [[PeekViewController alloc] init];
        return peekViewController;
    }
}

- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    PopViewController *popViewController = [[PopViewController alloc] init];
    [self showViewController:popViewController sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
