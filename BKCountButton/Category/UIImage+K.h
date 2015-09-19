//
//  UIImage+K.h
//  Login
//
//  Created by apple on 14/11/18.
//  Copyright (c) 2014年 TJF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (K)
/**
 *  拉伸图片
 *
 *  @param normal 被拉伸图片名
 *
 *  @return 返回一张拉伸好的图片
 */
+ (UIImage *)resizableImageName:(NSString *)imageName;

/**
 *  画圆形图片
 *
 *  @param name        原始图片名
 *  @param borderWidth 边框宽度
 *  @param borderColor 边框颜色
 *
 *  @return 圆形图片
 */
+ (UIImage *)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

@end
