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
    
    self.j = Count / 2;
    self.i = self.j;
    k = self.j;
}

- (void)beginAnimation{
    
    if (self.j == 0) {
        [self fireTimer];
        [self afterSorted];
        return;
    }
    
    if (self.i == Count) {
        self.j = self.j / 2;
        self.i = self.j;
        k = self.i;
        NSLog(@"change j = %zd",self.j);
        return;
    }
    
    if (k-self.j < 0 || [self.examples[k] integerValue] >= [self.examples[k-self.j] integerValue]) {
        [self reSetLabelBg];
        self.i++;
        k = self.i;
        return;
    }
    
    UILabel *label = self.labels[k];
    label.backgroundColor = [UIColor redColor];
    if (k-self.j != 0) {
        UILabel *label = self.labels[k-self.j];
        label.backgroundColor = [UIColor whiteColor];
    }
    
    if ([self.examples[k] integerValue] < [self.examples[k-self.j] integerValue]) {
        [self fireTimer];
        [UIView animateWithDuration:Duration animations:^{
            [self swapArray:self.examples firstIndex:k secondIndex:k-self.j];
        } completion:^(BOOL finished) {
            k -= self.j;
            [self startTimer];
        }];
        
    }
    NSLog(@"i : %zd,j : %zd,k : %zd",self.i,self.j,k);
}

- (void)sort{
    
}

- (void)popVc{
    [self.navigationController popViewControllerAnimated:YES];
    [self fireTimer];
}
@end
