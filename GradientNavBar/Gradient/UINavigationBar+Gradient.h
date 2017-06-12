//
//  UINavigationBar+Gradient.h
//  GradientNavBar
//
//  Created by xujunhao on 2017/6/12.
//  Copyright © 2017年 cocoadogs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (Gradient)

- (void)xjh_setBackgroundoffset:(CGFloat)offset
                          color:(UIColor *)color;

- (void)xjh_setTranslationOffset:(CGFloat)offset
                           color:(UIColor *)color;

@end
