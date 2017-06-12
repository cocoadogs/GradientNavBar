//
//  UINavigationBar+Gradient.m
//  GradientNavBar
//
//  Created by xujunhao on 2017/6/12.
//  Copyright © 2017年 cocoadogs. All rights reserved.
//

#import "UINavigationBar+Gradient.h"

@interface UIImage (GradientNavBar)

+ (UIImage *)imageWithColor:(UIColor *)color;

@end

@implementation UIImage (GradientNavBar)

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end


@implementation UINavigationBar (Gradient)

- (void)xjh_setBackgroundoffset:(CGFloat)offset
                          color:(UIColor *)color {
    CGRect navBarFrame = self.frame;
    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
    CGFloat height = navBarFrame.size.height + statusBarFrame.size.height;
    
    if (offset <= -64) {
        self.translucent = YES;
        [self setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    } else if (-64 < offset && offset < 0) {
        self.translucent = YES;
        [self setBackgroundImage:[UIImage imageWithColor:[color colorWithAlphaComponent:1+offset/height]] forBarMetrics:UIBarMetricsDefault];
    } else {
        self.translucent = NO;
        [self setBackgroundImage:[UIImage imageWithColor:color] forBarMetrics:UIBarMetricsDefault];
    }
    [self setShadowImage:[UIImage new]];
}

- (void)xjh_setTranslationOffset:(CGFloat)offset
                           color:(UIColor *)color {
    
    CGRect navBarFrame = self.frame;
    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
    CGFloat height = navBarFrame.size.height + statusBarFrame.size.height;
        
    if (offset > 0) {
        if (offset >= height) {
            self.transform = CGAffineTransformMakeTranslation(0, -height);
        } else {
            self.translucent = YES;
            self.transform = CGAffineTransformMakeTranslation(0, -offset);
            [self setBackgroundImage:[UIImage imageWithColor:[color colorWithAlphaComponent:1-offset/height]] forBarMetrics:UIBarMetricsDefault];
        }
    } else {
        self.transform = CGAffineTransformMakeTranslation(0, 0);
        self.translucent = NO;
    }
    
    [self setShadowImage:[UIImage new]];
    
}

@end

