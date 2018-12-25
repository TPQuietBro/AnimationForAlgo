//
//  MergeViewController.m
//  AnimationsForAlgo
//
//  Created by allentang on 2018/10/9.
//  Copyright © 2018 唐鹏. All rights reserved.
//

#import "MergeViewController.h"
#define DEEP [self totalDeep]
@interface MergeViewController ()
@property (nonatomic,assign) NSInteger start;
@property (nonatomic,assign) NSInteger end;
@property (nonatomic,assign) NSInteger mid;
@property (nonatomic,assign) NSInteger deep;
@property (nonatomic,strong) NSMutableArray *tempArray;
@end

@implementation MergeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.start = 0;
    self.end = Count - 1;
    self.mid = Count * 0.5;
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
    if (self.start >= Count) {
        self.start = 0;
        return;
    }
    UILabel *label = self.labels[self.start];
    NSLog(@"start : %zd,end : %zd,mid : %zd",self.start,self.end,self.mid);
    
    if (self.start >= self.mid) {
        label.x += 20;
    } else {
        label.x -= 20;
    }
    label.y += label.height + 10;
    
    if (self.start == self.end) {
        NSLog(@"deep + 1");
        NSInteger end = self.end;
        ++self.deep;
        self.start = 0;
        self.mid = self.mid * 0.5;
        self.end = end / pow(2,self.deep);
        return;
    }
    
    self.start ++;
}

- (NSTimeInterval)duration{
    return 0.2;
}

- (NSInteger)totalDeep{
    NSInteger count = 0;
    NSInteger total = self.labels.count;
    while (total / 2 > 0) {
        total /= 2;
        count++;
    }
    return count+1;
}

#pragma mark - sort

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
