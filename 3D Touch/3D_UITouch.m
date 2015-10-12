//
//  3D_UITouch.m
//  3D Touch
//
//  Created by 吴瀚波 on 15/10/12.
//  Copyright © 2015年 tmall. All rights reserved.
//

#import "3D_UITouch.h"

@implementation _D_UITouch

-(instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:1];
    }
    return self;
}


- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    NSLog(@"%f",touch.force);
    self.backgroundColor = [UIColor colorWithRed:(touch.force / touch.maximumPossibleForce )green:0 blue:1 alpha:1];
    
    if (touch.force == touch.maximumPossibleForce)
    {
        //20/3
        NSLog(@"%f",touch.force);
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:1];
}


@end
