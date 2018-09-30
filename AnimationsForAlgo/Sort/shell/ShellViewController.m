//
//  ShellViewController.m
//  AnimationsForAlgo
//
//  Created by 唐鹏 on 2018/9/29.
//  Copyright © 2018 唐鹏. All rights reserved.
//

#import "ShellViewController.h"

@interface ShellViewController ()
@end

@implementation ShellViewController
static NSInteger k = 0;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Shell";
    j = Count / 2;
    i = j;
    k = j;
}

- (void)beginAnimation{
    
    if (j == 0) {
        [self fireTimer];
        [self afterSorted];
        return;
    }
    
    if (i == Count) {
        j = j / 2;
        i = j;
        k = i;
        NSLog(@"change j = %zd",j);
        return;
    }
    
    if (k-j < 0 || [self.examples[k] integerValue] >= [self.examples[k-j] integerValue]) {
        [self reSetLabelBg];
        i++;
        k = i;
        return;
    }
    
    UILabel *label = self.labels[k];
    label.backgroundColor = [UIColor redColor];
    if (k-j != 0) {
        UILabel *label = self.labels[k-j];
        label.backgroundColor = [UIColor whiteColor];
    }
    
    if ([self.examples[k] integerValue] < [self.examples[k-j] integerValue]) {
        [self fireTimer];
        [UIView animateWithDuration:Duration animations:^{
            [self swapArray:self.examples firstIndex:k secondIndex:k-j];
        } completion:^(BOOL finished) {
            k -= j;
            [self startTimer];
        }];
        
    }
    NSLog(@"i : %zd,j : %zd,k : %zd",i,j,k);
}

- (void)sort{
    
}

@end
