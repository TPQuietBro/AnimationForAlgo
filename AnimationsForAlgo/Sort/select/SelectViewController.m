//
//  SelectViewController.m
//  AnimationsForAlgo
//
//  Created by allentang on 2018/9/28.
//  Copyright © 2018年 唐鹏. All rights reserved.
//

#import "SelectViewController.h"

@interface SelectViewController ()

@end

@implementation SelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Select";
}

- (void)beginAnimation{
    __block NSInteger min = j;
    if (j == Count) {
        [self afterSorted];
        [self fireTimer];
        return;
    }
    if (i == Count) {
        i = j+1;
        j ++;
        [self reSetLabelBg];
        return;
    }
    UILabel *label = self.labels[i];
    label.backgroundColor = [UIColor redColor];
    if (i != 0) {
        UILabel *label = self.labels[i - 1];
        label.backgroundColor = [UIColor whiteColor];
    }
    if ([self.examples[min] integerValue] > [self.examples[i] integerValue]) {
        [self fireTimer];
        [UIView animateWithDuration:Duration animations:^{
            [self swapArray:self.examples firstIndex:min secondIndex:i];
            min = i;
        }completion:^(BOOL finished) {
            [self startTimer];
        }];
    }
    i++;
}
- (void)sort{
    
}
@end
