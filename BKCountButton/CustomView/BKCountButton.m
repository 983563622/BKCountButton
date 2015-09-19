//
//  BKCountButton.m
//  BKCountButton
//
//  Created by apple on 15/9/18.
//  Copyright (c) 2015年 king. All rights reserved.
//

#import "BKCountButton.h"
#import "UIButton+K.h"

static const CGFloat buttonRatio = 0.0;

// 相关宏定义
#define kBackButtonWidth self.bounds.size.width
#define kBackButtonHeight self.bounds.size.height

@interface BKCountButton ()

@end

@implementation BKCountButton
#pragma mark - life cycle
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        // Initialization code
        
        // titleLabel
        [self.titleLabel setFont:[UIFont systemFontOfSize:17]];
        
        [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
    }
    
    return self;
}

- (void)dealloc
{
    NSLog(@"%s",__func__);
}

#pragma mark - public methods
- (void)configWithNormalTitle:(NSString *)normalTitle NormalTitleColor:(UIColor *)normalTitleColor disableTitleColor:(UIColor *)disableTitleColor normalImage:(NSString *)normalImage highlightedImage:(NSString *)highlightedImage selectedImage:(NSString *)selectedImage andDisableImage:(NSString *)disabledImage
{
    [self initWithButtonBackgroundWithNormalImage:normalImage highlightedImage:highlightedImage selectedImage:selectedImage disabledImage:disabledImage];
    
    [self setTitle:normalTitle ? normalTitle : @"重新发送" forState:UIControlStateNormal];
    
    [self setTitleColor:normalTitleColor ? normalTitleColor : [UIColor whiteColor] forState:UIControlStateNormal];
    
    [self setTitleColor:disableTitleColor ? disableTitleColor : [UIColor whiteColor] forState:UIControlStateDisabled];
}

- (void)startWithTime:(NSInteger)timeout waitPrefixTitle:(NSString *)prefixTitle andWaitSuffixTitle:(NSString *)suffixTitle
{
    __block NSInteger startIndex = timeout;
    
    // 指定线程队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    // 创建定时器
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    // 指定间隔
    dispatch_source_set_timer(timer,dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    
    // 执行的任务
    dispatch_source_set_event_handler(timer, ^
    {
        if(startIndex <= 0)
        {
            // 取消定时器
            dispatch_source_cancel(timer);
            
            dispatch_async(dispatch_get_main_queue(), ^
            {
                [self setEnabled:YES];
            });
        }
        else
        {
            int seconds = startIndex % 60;
            
            dispatch_async(dispatch_get_main_queue(), ^
            {
                NSString *disableTitle = [NSString stringWithFormat:@"%@%02d%@",(prefixTitle ? prefixTitle : @""),seconds,(suffixTitle ? suffixTitle : @"")];
                
                NSLog(@"%@",disableTitle);
                
                [self setTitle:disableTitle forState:UIControlStateDisabled];
                
                [self setEnabled:NO];
            });
            
            startIndex --;
        }
    });
    
    // 开启定时器
    dispatch_resume(timer);
}

- (void)startAnimationWithTime:(NSInteger)timeout waitPrefixTitle:(NSString *)prefixTitle andWaitSuffixTitle:(NSString *)suffixTitle
{
    __block NSInteger startIndex = timeout;
    
    self.titleLabel.transform = CGAffineTransformMakeScale(1, 1);
    
    self.titleLabel.alpha = 1;
    
    if (startIndex > 0)
    {
        [self setEnabled:NO];
        
        NSString *disableTitle = [NSString stringWithFormat:@"%@%zd%@",(prefixTitle ? prefixTitle : @""),startIndex,(suffixTitle ? suffixTitle : @"")];
        
        NSLog(@"%@",disableTitle);
        
        [self setTitle:disableTitle forState:UIControlStateDisabled];
        
        [UIView animateWithDuration:1 animations:^
        {
            self.titleLabel.transform = CGAffineTransformMakeScale(1.2, 1.2);

            self.titleLabel.alpha = 0.0;
        }
        completion:^(BOOL finished)
        {
            startIndex --;

            [self startAnimationWithTime:startIndex waitPrefixTitle:prefixTitle andWaitSuffixTitle:suffixTitle];
        }];
    }
    else
    {
        [self setEnabled:YES];
    }
}

#pragma mark - reload methods
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = 0.0f;
    
    CGFloat imageY = 0.0f;
    
    CGFloat imageWidth = kBackButtonWidth * buttonRatio;
    
    CGFloat imageHeight = kBackButtonHeight;
    
    return CGRectMake(imageX, imageY, imageWidth, imageHeight);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = kBackButtonWidth * buttonRatio;
    
    CGFloat titleY = 0.0f;
    
    CGFloat titleWidth = kBackButtonWidth * (1 - buttonRatio);
    
    CGFloat titleHeight = kBackButtonHeight;
    
    return CGRectMake(titleX, titleY, titleWidth, titleHeight);
}

@end
