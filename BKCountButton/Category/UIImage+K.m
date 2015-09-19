//
//  UIImage+K.m
//  Login
//
//  Created by apple on 14/11/18.
//  Copyright (c) 2014年 TJF. All rights reserved.
//

#import "UIImage+K.h"

@implementation UIImage (K)
#pragma mark - public methods
/**
 *  拉伸图片
 *
 *  @param normal 被拉伸图片名
 *
 *  @return 返回一张拉伸好的图片
 */
+ (UIImage *)resizableImageName:(NSString *)imageName
{
    UIImage *myImage = [UIImage imageNamed:imageName];
    
    CGFloat textViewW = myImage.size.width;
    
    CGFloat textViewH = myImage.size.height;
    
    UIEdgeInsets insets = UIEdgeInsetsMake(textViewH/2, textViewW/2, textViewH/2, textViewW/2);
    
    return [myImage resizableImageWithCapInsets:insets];
}

+ (UIImage *)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    // 加载原图
    UIImage *originalImage = [UIImage imageNamed:name];
    
    // 开启上下文
    CGFloat imageW = originalImage.size.width + borderWidth;
    
    CGFloat imageH = originalImage.size.height + borderWidth;
    
    CGSize imageSize = CGSizeMake(imageW, imageH);
    
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    
    // 取得当前的上下文(即上面刚得到的图片上下文)
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 画边框(大圆)
    [borderColor set];
    
    CGFloat bigRadius = imageW * 0.5; // 半径
    
    CGFloat centerX = bigRadius; // 圆心
    
    CGFloat centerY = bigRadius;
    
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    
    CGContextFillPath(ctx); // 画圆
    
    // 小圆
    CGFloat smallRadius = bigRadius - borderWidth;
    
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    
    // 裁剪
    CGContextClip(ctx);
    
    // 画圆
    [originalImage drawInRect:CGRectMake(borderWidth, borderWidth, originalImage.size.width, originalImage.size.height)];
    
    // 取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
