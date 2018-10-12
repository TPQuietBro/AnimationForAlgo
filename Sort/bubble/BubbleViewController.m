//
//  BubbleViewController.m
//  AnimationsForAlgo
//
//  Created by 唐鹏 on 2018/9/27.
//  Copyright © 2018 唐鹏. All rights reserved.
//

#import "BubbleViewController.h"

@interface BubbleViewController ()
@end

@implementation BubbleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)beginAnimation{
    if (self.j == Count - 1) {
        [self afterSorted];
        [self fireTimer];
        return;
    }
    if (self.i == Count - self.j - 1) {
        self.i = 0;
        self.j ++;
        [self reSetLabelBg];
        return;
    }
    UILabel *label = self.labels[self.i];
    label.backgroundColor = [UIColor redColor];
    if (self.i != 0) {
        UILabel *label = self.labels[self.i - 1];
        label.backgroundColor = [UIColor whiteColor];
    }
    if ([self.examples[self.i] integerValue] > [self.examples[self.i+1] integerValue]) {
        [self fireTimer];
        [UIView animateWithDuration:Duration animations:^{
            [self swapArray:self.examples firstIndex:self.i secondIndex:self.i+1];
        }completion:^(BOOL finished) {
            [self startTimer];
        }];
    }
    self.i++;
}

- (void)sort{
    for (NSInteger i = 0; i < Count; ++i) {
        for (NSInteger j = 0; j < Count - 1 - i; ++j) {
            if ([self.examples[j] integerValue] > [self.examples[j+1] integerValue]) {
                [self swapArray:self.examples firstIndex:j secondIndex:j+1];
            }
        }
    }
}

- (void)popVc{
    [self.navigationController popViewControllerAnimated:YES];
    [self fireTimer];
}
@end
