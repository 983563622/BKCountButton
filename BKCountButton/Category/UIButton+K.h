//
//  UIButton+K.h
//  Login
//
//  Created by apple on 14/11/18.
//  Copyright (c) 2014年 TJF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (K)
/**
 *  初始化并创建按钮
 *
 *  @param normal      normal image name
 *  @param highlighted highlighted image
 *  @param selected    selected image name
 *  @param disabled    disabled image name
 */
- (void)initWithButtonBackgroundWithNormalImage:(NSString *)normal highlightedImage:(NSString *)highlighted selectedImage:(NSString *)selected disabledImage:(NSString *)disabled;

@end
