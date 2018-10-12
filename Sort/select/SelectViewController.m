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
//    self.navigationItem.title = @"Select";
}

- (void)beginAnimation{
    __block NSInteger min = self.j;
    if (self.j == Count) {
        [self afterSorted];
        [self fireTimer];
        return;
    }
    if (self.i == Count) {
        self.i = self.j+1;
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
    if ([self.examples[min] integerValue] > [self.examples[self.i] integerValue]) {
        [self fireTimer];
        [UIView animateWithDuration:Duration animations:^{
            [self swapArray:self.examples firstIndex:min secondIndex:self.i];
            min = self.i;
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
