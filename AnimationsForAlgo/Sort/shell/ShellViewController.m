//
//  ShellViewController.m
//  AnimationsForAlgo
//
//  Created by 唐鹏 on 2018/9/29.
//  Copyright © 2018 唐鹏. All rights reserved.
//

#import "ShellViewController.h"

@interface ShellViewController ()
@property (nonatomic, assign) NSInteger hb;
@end

@implementation ShellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Shell";
    self.hb = Count / 2;
}
static NSInteger k = 0;
- (void)beginAnimation{
    j = self.hb;
    if (j == 0) {
        [self fireTimer];
        [self afterSorted];
        return;
    }
    
    if (i == Count - 1) {
        j = j / 2;
        self.hb = j;
        return;
    }
    i = j;
    
    if (k-j < 0) {
        [self reSetLabelBg];
        i++;
        return;
    }
    k = i;
    
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
