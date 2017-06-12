//
//  UITabBar+Gradient.m
//  GradientNavBar
//
//  Created by xujunhao on 2017/6/12.
//  Copyright © 2017年 cocoadogs. All rights reserved.
//

#import "UITabBar+Gradient.h"

@implementation UITabBar (Gradient)

- (void)xjh_setBackgroundAlpha:(CGFloat)alpha {
    self.alpha = alpha;
}

- (void)xjh_setTranslationOffset:(CGFloat)offset {
    CGFloat transformTy = self.transform.ty - offset;
    if (transformTy > self.frame.size.height) {
        transformTy = self.frame.size.height;
    } else if (transformTy < 0) {
        transformTy = 0;
    }
    self.transform = CGAffineTransformMakeTranslation(0, transformTy);
}

- (void)xjh_moveByTranslationOffset:(CGFloat)offset {
    self.transform = CGAffineTransformMakeTranslation(0, offset);
}

@end
