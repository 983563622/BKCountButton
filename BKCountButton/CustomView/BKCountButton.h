//
//  BKCountButton.h
//  BKCountButton
//
//  Created by apple on 15/9/18.
//  Copyright (c) 2015年 king. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BKCountButton : UIButton

/**
 *  配置按钮
 *
 *  @param normalTitleColor  normal状态标题颜色
 *  @param disableTitleColor disable状态标题颜色
 *  @param normalImage       normal状态背景图片名称
 *  @param highlightedImage  highlighted状态背景图片名称
 *  @param selectedImage     selected状态背景图片名称
 *  @param disabledImage     disabled状态背景图片名称
 */
- (void)configWithNormalTitle:(NSString *)normalTitle NormalTitleColor:(UIColor *)normalTitleColor disableTitleColor:(UIColor *)disableTitleColor normalImage:(NSString *)normalImage highlightedImage:(NSString *)highlightedImage selectedImage:(NSString *)selectedImage andDisableImage:(NSString *)disabledImage;

/**
 *  带动画的倒计时
 *
 *  @param timeout     到计数
 *  @param prefixTitle disable状态标题前缀
 *  @param suffixTitle disable状态标题后缀
 */
- (void)startAnimationWithTime:(NSInteger)timeout waitPrefixTitle:(NSString *)prefixTitle andWaitSuffixTitle:(NSString *)suffixTitle;

/**
 *  不带动画的倒计时
 *
 *  @param timeout     到计数
 *  @param prefixTitle disable状态标题前缀
 *  @param suffixTitle disable状态标题后缀
 */
- (void)startWithTime:(NSInteger)timeout waitPrefixTitle:(NSString *)prefixTitle andWaitSuffixTitle:(NSString *)suffixTitle;

@end
