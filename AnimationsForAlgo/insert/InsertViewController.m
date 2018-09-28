//
//  InsertViewController.m
//  AnimationsForAlgo
//
//  Created by 唐鹏 on 2018/9/28.
//  Copyright © 2018 唐鹏. All rights reserved.
//

#import "InsertViewController.h"

@interface InsertViewController ()

@end

@implementation InsertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"insert";
}
static NSInteger i = 0;
static NSInteger j = 0;
- (void)beginAnimation{
    NSLog(@"i = %zd,j = %zd",i,j);
    if (j == self.examples.count) {
        [self afterSorted];
        [self fireTimer];
        return;
    }
    if (i == j) {
        i = 0;
        j++;
        [self reSetLabelBg];
        return;
    }
    
    NSInteger observer = [self.examples[j] integerValue];
    UILabel *label = self.labels[i];
    label.backgroundColor = [UIColor redColor];
    if (i != 0) {
        UILabel *label = self.labels[i-1];
        label.backgroundColor = [UIColor whiteColor];
    }
    if (observer < [self.examples[i] integerValue]) {
        [self fireTimer];
        [UIView animateWithDuration:Duration animations:^{
            [self swapArray:self.examples firstIndex:j secondIndex:i];
        }completion:^(BOOL finished) {
            [self startTimer];
        }];
    }
    i++;
}

- (void)sort{
    
}

@end
