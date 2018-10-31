//
//  MergeViewController.m
//  AnimationsForAlgo
//
//  Created by allentang on 2018/10/9.
//  Copyright © 2018 唐鹏. All rights reserved.
//

#import "MergeViewController.h"

@interface MergeViewController ()
@property (nonatomic,assign) NSInteger start;
@property (nonatomic,assign) NSInteger end;
@property (nonatomic,assign) NSInteger mid;
@property (nonatomic,strong) NSMutableArray *tempArray;
@end

@implementation MergeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.start = 0;
    self.end = Count - 1;
    self.mid = (self.start + self.end) * 0.5;
    self.j = self.mid + 1;
    [self sort];
    [self showBeginHud];
    [self adjustLabels];
    _tempArray = [NSMutableArray array];
}

- (void)adjustLabels{
    CGFloat LRMargin = (ViewWidth - Count * width) / 2;
    for (NSInteger i = 0; i < Count; i++) {
        UILabel *label = self.labels[i];
        label.frame = CGRectMake(LRMargin + i * width, 100, width, height);
    }
}

- (void)beginAnimation{
    if (self.start >= self.end) {
        [self afterSorted];
        return;
    }
    
    if (self.i > self.mid || self.j > self.end) {
        [self fireTimer];
        self.i = 0;
        self.mid = (self.mid + self.start) * 0.5;
        self.j = self.mid + 1;
        NSLog(@"i : %zd j : %zd mid : %zd",self.i,self.j,self.k);
        [self startTimer];
        return;
    }
    UILabel *leftLabel = self.labels[self.i];
    UILabel *rightLabel = self.labels[self.j];

    [UIView animateWithDuration:Duration animations:^{
        [self fireTimer];
        leftLabel.x -= 5;
        leftLabel.y += height + 10;
        [self.labels replaceObjectAtIndex:self.i withObject:leftLabel];
        
        rightLabel.x += 5;
        rightLabel.y += height + 10;
        [self.labels replaceObjectAtIndex:self.i withObject:rightLabel];
        
    } completion:^(BOOL finished) {
        self.i ++;
        self.j ++;
        [self startTimer];
    }];
//    NSMutableArray *tempArray = [NSMutableArray array];
}

- (void)sort{
    [self split:self.examples start:0 end:Count - 1];
    [self afterSorted];
}

- (void)merge:(NSMutableArray *)arr start:(NSInteger)start end:(NSInteger)end mid:(NSInteger)mid{
    NSMutableArray *tempArray = [NSMutableArray array];
    NSInteger i = start;
    NSInteger j = mid + 1;
    NSInteger k = 0;
    
    while (i <= mid && j <= end) {
        if ([arr[i] integerValue] <= [arr[j] integerValue]) {
            tempArray[k++] = arr[i++];
        } else {
            tempArray[k++] = arr[j++];
        }
    }
    while (i <= mid){
        tempArray[k++] = arr[i++];
    }
    
    while (j <= end){
        tempArray[k++] = arr[j++];
    }
    
    for (NSInteger i = 0; i< k; i++) {
        arr[start + i] = tempArray[i];
    }

    NSLog(@"tempArray:%@",tempArray);
}

- (void)split:(NSMutableArray *)arr start:(NSInteger)start end:(NSInteger)end{
    if (arr == nil || start >= end) {
        return;
    }
    NSInteger mid = (start + end) * 0.5;
    [self split:arr start:start end:mid];
    [self split:arr start:mid + 1 end:end];
    [self merge:arr start:start end:end mid:mid];
}

- (void)popVc{
    [self.navigationController popViewControllerAnimated:YES];
    [self fireTimer];
}

@end
