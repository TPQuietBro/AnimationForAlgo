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
    self.navigationItem.title = @"Insert";
}

- (void)beginAnimation{
    if (self.j == Count) {
        [self afterSorted];
        [self fireTimer];
        return;
    }
    if (self.i == self.j) {
        self.i = 0;
        self.j++;
        [self reSetLabelBg];
        return;
    }
    
    NSInteger observer = [self.examples[self.j] integerValue];
    UILabel *label = self.labels[self.i];
    label.backgroundColor = [UIColor redColor];
    if (self.i != 0) {
        UILabel *label = self.labels[self.i-1];
        label.backgroundColor = [UIColor whiteColor];
    }
    if (observer < [self.examples[self.i] integerValue]) {
        [self fireTimer];
        [UIView animateWithDuration:Duration animations:^{
            [self swapArray:self.examples firstIndex:self.j secondIndex:self.i];
        }completion:^(BOOL finished) {
            [self startTimer];
        }];
    }
    self.i++;
}

- (void)sort{
    
}

- (void)popVc{
    [self.navigationController popViewControllerAnimated:YES];
    [self fireTimer];
}
@end
