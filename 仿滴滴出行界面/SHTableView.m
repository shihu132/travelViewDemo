//
//  SHableView.m
//  仿滴滴出行界面
//
//  Created by joyshow on 2018/9/14.
//  Copyright © 2018年 石虎. All rights reserved.
//

#import "SHableView.h"

@implementation SHableView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    
    NSLog(@"point=%@",NSStringFromCGPoint(point));
    
    NSLog(@"y=%f",self.contentOffset.y);
    
    if (point.y<0) {
        return nil;
    }
    
    return  [super hitTest:point withEvent:event];
}
@end
