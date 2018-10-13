//
//  MergeViewController.m
//  AnimationsForAlgo
//
//  Created by allentang on 2018/10/9.
//  Copyright © 2018 唐鹏. All rights reserved.
//

#import "MergeViewController.h"

@interface MergeViewController ()

@end

@implementation MergeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)beginAnimation{
    NSMutableArray *tempArray = [NSMutableArray array];
    [tempArray addObject:@""];
}

- (void)sort{
    
}

- (void)popVc{
    [self.navigationController popViewControllerAnimated:YES];
    [self fireTimer];
}

@end
