# BKCountButton

一键集成倒计时按钮

## Description

本Demo集成了ARC环境下倒计时按钮的两种风格

## Features

1. 集成了ARC环境下倒计时按钮的两种风格

## 效果图
<img src="https://github.com/BossKing/BKCountButton/blob/master/BKCountButton.gif"/>

## Two Styles
### no animation:
```objective-c
@implementation ViewController
#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [_countBtn configWithNormalTitle:@"重新发送验证码"
                    NormalTitleColor:[UIColor whiteColor]
                   disableTitleColor:[UIColor blackColor]
                         normalImage:@"common_green_btn_n"
                    highlightedImage:@"common_green_btn_h"
                       selectedImage:@"common_gray_btn_n"
                     andDisableImage:@"common_gray_btn_n"];
    
    [self clickBtnForBKCountController:_countBtn];
}

#pragma mark - event response
- (IBAction)clickBtnForBKCountController:(BKCountButton *)sender
{
    [sender startWithTime:10 waitPrefixTitle:nil andWaitSuffixTitle:@"秒后可再次获取"];
}
@end
```
### animation:
```objective-c
@implementation ViewController
#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [_countBtn configWithNormalTitle:@"重新发送验证码"
                    NormalTitleColor:[UIColor whiteColor]
                   disableTitleColor:[UIColor blackColor]
                         normalImage:@"common_green_btn_n"
                    highlightedImage:@"common_green_btn_h"
                       selectedImage:@"common_gray_btn_n"
                     andDisableImage:@"common_gray_btn_n"];
    
    [self clickBtnForBKAnimationCountController:_countBtn];
}

#pragma mark - event response
- (IBAction)clickBtnForBKAnimationCountController:(BKCountButton *)sender
{
    [sender startAnimationWithTime:10 waitPrefixTitle:nil andWaitSuffixTitle:@"秒后可再次获取"];
}
@end
```
## Requirements

| BKSingleton Version | Minimum iOS Target  | Minimum OS X Target  |                                   Notes                                   |
|:--------------------:|:---------------------------:|:----------------------------:|:-------------------------------------------------------------------------:|
|          1.x         |            iOS 6            |           OS X 10.9          |        |                                                                           |

