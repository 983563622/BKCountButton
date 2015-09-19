//
//  BKCountViewController.m
//  BKCountButton
//
//  Created by apple on 15/9/18.
//  Copyright (c) 2015年 king. All rights reserved.
//

#import "BKCountController.h"
#import "BKCountButton.h"

@interface BKCountController ()

@property (weak, nonatomic) IBOutlet BKCountButton *countBtn;

- (IBAction)clickBtnForBKCountController:(BKCountButton *)sender;

@end

@implementation BKCountController
#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUIScreenForBKCountController];
}

- (void)dealloc
{
    BKLog(@"");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - event response
- (IBAction)clickBtnForBKCountController:(BKCountButton *)sender
{
    [sender startWithTime:10 waitPrefixTitle:nil andWaitSuffixTitle:@"秒后可再次获取"];
}

#pragma mark - private methods
- (void)setupUIScreenForBKCountController
{
    [_countBtn configWithNormalTitle:@"重新发送验证码"
                    NormalTitleColor:[UIColor whiteColor]
                   disableTitleColor:[UIColor blackColor]
                         normalImage:@"common_green_btn_n"
                    highlightedImage:@"common_green_btn_h"
                       selectedImage:@"common_gray_btn_n"
                     andDisableImage:@"common_gray_btn_n"];
    
    [self clickBtnForBKCountController:_countBtn];
    
    [self.navigationItem setTitle:@"Count Button"];
}

@end
