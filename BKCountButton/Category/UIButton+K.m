//
//  UIButton+K.m
//  Login
//
//  Created by apple on 14/11/18.
//  Copyright (c) 2014年 TJF. All rights reserved.
//

#import "UIButton+K.h"
#import "UIImage+K.h"

@implementation UIButton (K)
#pragma mark - public methods
/**
 *  初始化指定图片的按钮
 *
 *  @param normal      normal态图片名
 *  @param highlighted highlighted状态图片名
 *  @param selected    selected状态图片名
 *  @param disabled    disable状态图片名
 */
- (void)initWithButtonBackgroundWithNormalImage:(NSString *)normal highlightedImage:(NSString *)highlighted selectedImage:(NSString *)selected disabledImage:(NSString *)disabled
{
    // 正常状态
    [self setBackgroundImage:[UIImage resizableImageName:normal] forState:UIControlStateNormal];
    
    // 高亮状态
    [self setBackgroundImage:[UIImage resizableImageName:highlighted] forState:UIControlStateHighlighted];
    
    // 选中状态
    [self setBackgroundImage:[UIImage resizableImageName:selected] forState:UIControlStateSelected];
    
    // 不可用状态
    [self setBackgroundImage:[UIImage resizableImageName:disabled] forState:UIControlStateDisabled];
}

@end
