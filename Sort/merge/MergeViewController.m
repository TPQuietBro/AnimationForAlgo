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
@property (nonatomic,strong) NSTimer *tempTimer;
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
    [self startTempTimer];
}

- (void)adjustLabels{
    CGFloat LRMargin = (ViewWidth - Count * width) / 2;
    for (NSInteger i = 0; i < Count; i++) {
        UILabel *label = self.labels[i];
        label.frame = CGRectMake(LRMargin + i * width, 100, width, height);
    }
}

- (void)startTempTimer{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:Duration target:self selector:@selector(beginSecondAnimation) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    _tempTimer = timer;
}

- (void)beginSecondAnimation{
    if (self.start >= self.end) {
        [self afterSorted];
        return;
    }
    NSLog(@"self.mid : %zd",self.mid);
    if (self.j > self.end) {
        [self fireTempTimer];
        return;
    }
    UILabel *tempLabel = self.labels[self.j];
    [UIView animateWithDuration:Duration animations:^{
        [self fireTempTimer];
        tempLabel.x += 5;
        tempLabel.y += height + 10;
        [self.labels replaceObjectAtIndex:self.j withObject:tempLabel];
    } completion:^(BOOL finished) {
        self.j ++;
        [self startTempTimer];
    }];
    
}

- (void)beginAnimation{
    
    if (self.start >= self.end) {
        [self afterSorted];
        return;
    }
    if (self.i == self.mid) {
        [self fireTimer];
        return;
    }
    UILabel *tempLabel = self.labels[self.i];
    [UIView animateWithDuration:Duration animations:^{
        [self fireTimer];
        tempLabel.x -= 5;
        tempLabel.y += height + 10;
        [self.labels replaceObjectAtIndex:self.i withObject:tempLabel];
    } completion:^(BOOL finished) {
        self.i ++;
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
//    NSLog(@"start1:%zd end1:%zd",start,mid);
    [self split:arr start:start end:mid];
//    NSLog(@"start2:%zd end:%zd",mid + 1,end);
    [self split:arr start:mid + 1 end:end];
//    NSLog(@"start23:%zd end:%zd mid:%zd",start,end,mid);
    [self merge:arr start:start end:end mid:mid];
}

- (void)fireTempTimer{
    [self.tempTimer invalidate];
    self.tempTimer = nil;
}

- (void)popVc{
    [self.navigationController popViewControllerAnimated:YES];
    [self fireTimer];
    [self fireTempTimer];
}

@end
