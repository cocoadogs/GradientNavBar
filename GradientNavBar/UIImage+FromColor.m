//
//  UIImage+FromColor.m
//  GradientNavBar
//
//  Created by xujunhao on 2017/6/12.
//  Copyright © 2017年 cocoadogs. All rights reserved.
//

#import "UIImage+FromColor.h"

@implementation UIImage (FromColor)

+ (UIImage *)creatFromColor:(UIColor *)color {
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
