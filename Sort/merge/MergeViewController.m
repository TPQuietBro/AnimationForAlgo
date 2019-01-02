//
//  MergeViewController.m
//  AnimationsForAlgo
//
//  Created by allentang on 2018/10/9.
//  Copyright © 2018 唐鹏. All rights reserved.
//

#import "MergeViewController.h"

#define DEEP [self totalDeep]

static CGFloat defaultHorizonalMargin = 30;
static CGFloat defaultVerticalMargin = 10;

@interface MergeViewController ()
@property (nonatomic,assign) NSInteger start;
@property (nonatomic,assign) NSInteger end;
@property (nonatomic,assign) NSInteger mid;
@property (nonatomic,assign) NSInteger deep;
@property (nonatomic,strong) NSMutableArray *tempArray;
@property (nonatomic, strong) NSMutableDictionary *endDict;
@end

@implementation MergeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.start = 0;
    self.end = Count - 1;
    self.mid = self.end * 0.5;
    [self sort];
    [self showHudWithTip:kStartSort];
    [self adjustLabels];
    _tempArray = [NSMutableArray array];
    [self initEndDict];
    NSLog(@"endDict : %@",self.endDict);
}

// 找到潜在的分界点
- (void)initEndDict{
    if (_endDict) {
        return;
    }
    _endDict = [NSMutableDictionary dictionary];
    
    for (NSInteger i=0; i < [self totalDeep]; ++i) {
        
        NSInteger split = pow(2, i);
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSInteger j = 0; j < split; ++j) {
            NSNumber *end = @(Count / split - 1 + j * (Count / split));
            [tempArray addObject:end];
        }
        [_endDict setObject:tempArray forKey:@(i)];
    }
}

- (void)adjustLabels{
    CGFloat LRMargin = (ViewWidth - Count * width) / 2;
    for (NSInteger i = 0; i < Count; i++) {
        UILabel *label = self.labels[i];
        label.frame = CGRectMake(LRMargin + i * width, 100, width, height);
    }
}
- (void)beginAnimation{
    [self split];
}

- (void)split{
    // 如果到最大深度就停止
    if (self.deep == [self totalDeep]) {
        [self fireTimer];
        [self showHudWithTip:@"分割完成,马上开始归并"];
        return;
    }
    
    UILabel *label = self.labels[self.start];
    //    NSLog(@"start : %zd,end : %zd,mid : %zd,deep:%zd,i:%zd",self.start,self.end,self.mid,self.deep,self.i);
    // 根据深度来设置间隔
    CGFloat margin = defaultHorizonalMargin / pow(2, self.deep);
    
    if (self.start > self.mid) {
        label.x += margin;
    } else {
        label.x -= margin;
    }
    label.y += label.height + defaultVerticalMargin;
    
    if (self.start == self.end) {
        self.i ++;
        NSArray *endIndexes = self.endDict[@(self.deep)];
        NSInteger split = endIndexes.count - 1;
        //        NSLog(@"===start : %zd,end : %zd,split:%zd,i:%zd",self.start,self.end,split,self.i);
        // 重置开始和结束的位置
        if (self.i > split) {
            self.i = 0;
            self.start = 0;
            self.deep++;
            
            endIndexes = self.endDict[@(self.deep)];
            self.end = [endIndexes[self.i] integerValue];
            self.mid = (self.start + self.end) * 0.5;
            //            NSLog(@"deep + 1,end:%zd",self.end);
            return;
        }
        self.start = self.i * (Count / pow(2, self.deep));
        self.end = [endIndexes[self.i] integerValue];
        self.mid = (self.start + self.end) * 0.5;
        //        NSLog(@"start:%zd, end:%zd, mid:%zd, deep:%zd, i:%zd",self.start,self.end,self.mid,self.deep,self.i);
    } else {
        self.start ++;
    }
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
    return count;
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
