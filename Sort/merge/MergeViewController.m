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
@property (nonatomic,assign) NSInteger deep1;
@property (nonatomic,assign) NSInteger deep2;
@property (nonatomic,strong) NSMutableArray *tempArray;
@property (nonatomic, strong) NSMutableDictionary *endDict;
@property (nonatomic, strong) NSMutableArray *margins;
@property (nonatomic,assign) BOOL isFinishSpliting;
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
    _margins = [NSMutableArray array];
    [self initEndDict];
    NSLog(@"endDict : %@",self.endDict);
}

// 找到潜在的分界点
- (void)initEndDict{
    if (_endDict) {
        return;
    }
    _endDict = [NSMutableDictionary dictionary];
    
    for (NSInteger i=0; i < DEEP; ++i) {
        
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
    __weak typeof(self) wSelf = self;
    [self splitWithBlock:^{
        [wSelf startTimer];
    }];
    [self merge];
}

- (void)merge{
    if (!self.isFinishSpliting) {
        return;
    }
    
    if (self.deep2 < 0) {
        [self showHudWithTip:kFinishSort];
        [self fireTimer];
        return;
    }
    
//    UILabel *label = self.labels[self.start];
    UILabel *label = self.labels[self.start];
    // 根据深度来设置间隔
    CGFloat margin = [self.margins[self.deep2] floatValue];
//    NSLog(@"start:%zd,mid:%zd,end:%zd",self.start,self.mid,self.end);
    
//    if (self.start > self.mid) {
//        label.x -= margin;
//    } else {
//        label.x += margin;
//    }
    [self updateFrameForLabel:label margin:margin];
    
    if (self.start == self.end) {
        self.j++;
        NSArray *endIndexes = self.endDict[@(self.deep2)];
        NSInteger split = endIndexes.count - 1;
        
        if (self.j > split) {
            self.j = 0;
            self.start = 0;
            self.deep2--;
            
            endIndexes = self.endDict[@(self.deep2)];
            self.end = [endIndexes[self.j] integerValue];
            self.mid = (self.start + self.end) * 0.5;
            return;
        }
        self.start = self.j * (Count / pow(2, self.deep2));
        self.end = [endIndexes[self.j] integerValue];
        self.mid = (self.start + self.end) * 0.5;
        
    } else {
        self.start ++;
    }
}

- (void)updateFrameForLabel:(UILabel *)label margin:(CGFloat)margin{
    if (self.start+1 >= Count) {
        label.x -= margin;
        label.y += label.height + defaultVerticalMargin;
        return;
    }
    NSInteger nextIndex = self.end;
    nextIndex ++;
    if (nextIndex > self.end) {
        nextIndex --;
    }
    
    NSInteger sNum = label.text.integerValue;
    NSInteger nextNum = [self.labels[nextIndex] text].integerValue;
    
    if (self.start < self.mid) {
        if (sNum > nextNum) {
            label.x += margin;
        } else {
            label.x -= margin;
        }
    } else {
        if (sNum > nextNum) {
            label.x += margin;
        } else {
            label.x -= margin;
        }
    }
    
    label.y += label.height + defaultVerticalMargin;
}

- (NSInteger)currentSplit{
    NSArray *endIndexes = self.endDict[@(self.deep2)];
    NSInteger split = endIndexes.count - 1;
    return split;
}

- (void)splitWithBlock:(void(^)(void))block{
    // 如果到最大深度就停止
    
    if (self.deep1 > DEEP) {
        return;
    }
    
    if (self.deep1 == DEEP) {
        self.deep2 = self.deep1 - 1;
        self.deep1 ++;//++的目的是为了只赋值一次
        
        NSArray *endIndexes = self.endDict[@(self.deep2)];
        self.start = 0;
        self.end = [endIndexes[0] integerValue];
        self.mid = (self.start + self.end) * 0.5;
        [self fireTimer];
        [self showHudWithTip:@"分割完成,马上开始归并"];
        self.isFinishSpliting = YES;
        block ? block() : nil;
        return;
    }
    
    UILabel *label = self.labels[self.start];
    //    NSLog(@"start : %zd,end : %zd,mid : %zd,deep:%zd,i:%zd",self.start,self.end,self.mid,self.deep,self.i);
    // 根据深度来设置间隔
    CGFloat margin = defaultHorizonalMargin / pow(2, self.deep1);
    
    if (![_margins containsObject:@(margin)]) {
        [_margins addObject:@(margin)];
    }
    
    if (self.start > self.mid) {
        label.x += margin;
    } else {
        label.x -= margin;
    }
    label.y += label.height + defaultVerticalMargin;
    
    if (self.start == self.end) {
        self.i ++;
        NSArray *endIndexes = self.endDict[@(self.deep1)];
        NSInteger split = endIndexes.count - 1;
        //        NSLog(@"===start : %zd,end : %zd,split:%zd,i:%zd",self.start,self.end,split,self.i);
        // 重置开始和结束的位置
        if (self.i > split) {
            self.i = 0;
            self.start = 0;
            self.deep1++;
            
            endIndexes = self.endDict[@(self.deep1)];
            self.end = [endIndexes[self.i] integerValue];
            self.mid = (self.start + self.end) * 0.5;
            //            NSLog(@"deep + 1,end:%zd",self.end);
            return;
        }
        self.start = self.i * (Count / pow(2, self.deep1));
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
