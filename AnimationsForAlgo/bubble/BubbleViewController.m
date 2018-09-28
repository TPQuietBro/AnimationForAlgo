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
    self.navigationItem.title = @"bubble";
}
static NSInteger i = 0;
static NSInteger j = 0;
- (void)beginAnimation{
    if (j == self.examples.count - 1) {
        [self afterSorted];
        [self fireTimer];
        return;
    }
    if (i == self.examples.count - j - 1) {
        i = 0;
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
    if ([self.examples[i] integerValue] > [self.examples[i+1] integerValue]) {
        [self fireTimer];
        [UIView animateWithDuration:Duration animations:^{
            [self swapArray:self.examples firstIndex:i secondIndex:i+1];
        }completion:^(BOOL finished) {
            [self startTimer];
        }];
    }
    i++;
}
- (void)sort{
    for (NSInteger i = 0; i < self.examples.count; ++i) {
        for (NSInteger j = 0; j < self.examples.count - 1 - i; ++j) {
            if ([self.examples[j] integerValue] > [self.examples[j+1] integerValue]) {
                [self swapArray:self.examples firstIndex:j secondIndex:j+1];
            }
        }
    }
}
@end
