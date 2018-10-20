//
//  MergeViewController.m
//  AnimationsForAlgo
//
//  Created by allentang on 2018/10/9.
//  Copyright © 2018 唐鹏. All rights reserved.
//

#import "MergeViewController.h"

@interface MergeViewController ()
@property (nonatomic,assign) NSInteger start;
@property (nonatomic,assign) NSInteger end;
@property (nonatomic,assign) NSInteger mid;
@property (nonatomic,strong) NSMutableArray *tempArray;
@end

@implementation MergeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化值
    self.start = 0;
    self.end = Count - 1;
    self.mid = (self.start + self.end) * 0.5;
    [self showBeginHud];
}

// 左侧timer
- (void)beginAnimation{
    _tempArray = [NSMutableArray array];

    if (self.start >= self.end) {
        [self showFinishHud];
        return;
    }
    
}

- (void)sort{
    
}

- (void)popVc{
    [self.navigationController popViewControllerAnimated:YES];
    [self fireTimer];
}

@end
