//
//  BKAnimationCountController.m
//  BKCountButton
//
//  Created by apple on 15/9/18.
//  Copyright (c) 2015年 king. All rights reserved.
//

#import "BKAnimationCountController.h"
#import "BKCountButton.h"

@interface BKAnimationCountController ()

@property (weak, nonatomic) IBOutlet BKCountButton *countBtn;

- (IBAction)clickBtnForBKAnimationCountController:(BKCountButton *)sender;

@end

@implementation BKAnimationCountController
#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUIScreenForBKAnimationCountController];
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
- (IBAction)clickBtnForBKAnimationCountController:(BKCountButton *)sender
{
    [sender startAnimationWithTime:10 waitPrefixTitle:nil andWaitSuffixTitle:@"秒后可再次获取"];
}

#pragma mark - private methods
- (void)setupUIScreenForBKAnimationCountController
{
    [_countBtn configWithNormalTitle:@"重新发送验证码"
                    NormalTitleColor:[UIColor whiteColor]
                   disableTitleColor:[UIColor blackColor]
                         normalImage:@"common_green_btn_n"
                    highlightedImage:@"common_green_btn_h"
                       selectedImage:@"common_gray_btn_n"
                     andDisableImage:@"common_gray_btn_n"];
    
    [self clickBtnForBKAnimationCountController:_countBtn];
    
    [self.navigationItem setTitle:@"Animation Count Button"];
}

@end
