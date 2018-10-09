//
//  RadixViewController.m
//  AnimationsForAlgo
//
//  Created by 唐鹏 on 2018/10/8.
//  Copyright © 2018 唐鹏. All rights reserved.
//

#import "RadixViewController.h"
#import "TPFrame.h"
static NSInteger colSize = 9;
static CGFloat margin = 7.5;
static CGFloat colMargin = 5;
#define firstLabel self.labels.firstObject

@interface RadixViewController ()
@property (nonatomic, assign) NSInteger maxNumber;
@property (nonatomic, assign) NSInteger loops;
@property (nonatomic, strong) NSArray *baseNumbers;
@property (nonatomic, strong) NSMutableArray *tempArray;
@property (nonatomic, strong) NSMutableArray *baseArray;
@end

@implementation RadixViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"基数排序";
    self.maxNumber = [self maxNumber];
    self.loops = [self loopsWithNumber:self.maxNumber];
    self.baseNumbers = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    self.baseArray = [@[] mutableCopy];
    [self initBaseNumberLabels];
    [self addSepLine];
    
//    NSLog(@"----%@",self.tempArray);
//    self.k =
}

- (void)beginAnimation{
    
    if (self.j == self.loops) {
        [self fireTimer];
        [self afterSorted];
        return;
    }
    
    if (self.i == self.examples.count) {
        
        self.j ++;
        self.i = 0;
        self.k = 0;
        return;
    }
    
    if (self.k == colSize) {
        self.i ++;
        self.k = 0;
        return;
    }
    // 找到个位,十位......
    NSInteger rowIndex = [self positionWithNumber:[self.examples[self.i] integerValue] loop:self.j];
    if ([self.tempArray[rowIndex][self.k] length] == 0) {
        UILabel *label = self.labels[self.i];
        CGRect originFrame = label.frame;
        UILabel *baseLabel = self.baseArray[rowIndex];
        [UIView animateWithDuration:Duration animations:^{
            [self fireTimer];
            label.x = baseLabel.x + width + margin + self.k * (width + colMargin);
            label.y = baseLabel.y;
        } completion:^(BOOL finished) {
            [self addCpLabelWithLabel:label originFrame:originFrame];
            [self.tempArray[rowIndex] replaceObjectAtIndex:self.k withObject:self.examples[self.i]];
            self.i ++;
            self.k = 0;
            [self startTimer];
        }];
    } else {
        self.k ++;
    }
    
    NSLog(@"j = %zd,i = %zd,k = %zd,rowIndex = %zd",self.j,self.i,self.k,rowIndex);

}

- (void)sort{
    
}

- (void)popVc{
    [self.navigationController popViewControllerAnimated:YES];
    [self fireTimer];
}

#pragma mark - private

- (void)initBaseNumberLabels{
    CGFloat labelMargin = 10;
    CGFloat topMargin = 20 + height;
    
    for (NSInteger i = 0; i < self.baseNumbers.count; ++i) {
        UILabel *label = [[UILabel alloc] init];
        label.tp_text(self.baseNumbers[i]).tp_font(@12).tp_alignment(ENTextAlighmentCenter)
        .tp_systemTextColor(ENRedColor).tp_bgColor([UIColor whiteColor]);
        label.frame = CGRectMake([firstLabel x], CGRectGetMaxY([firstLabel frame]) + topMargin + i * (height  + labelMargin), width, height);
        [self.view addSubview:label];
        [self.baseArray addObject:label];
    }
    
    CGFloat rowTopMargin = 15;
    for (NSInteger j = 0; j < colSize; ++j) {
        UILabel *label = [[UILabel alloc] init];
        label.tp_text([NSString stringWithFormat:@"%zd",j]).tp_font(@12).tp_alignment(ENTextAlighmentCenter)
        .tp_bgColor([UIColor whiteColor]);
        label.frame = CGRectMake([firstLabel x] + width + colMargin + (width + colMargin) * j, CGRectGetMaxY([firstLabel frame]) + rowTopMargin , width, height);
        [self.view addSubview:label];
    }
    
}

- (void)addSepLine{
    
    UILabel *sepLabel = [[UILabel alloc] init];
    sepLabel.tp_bgColor([UIColor orangeColor]);
    sepLabel.frame = CGRectMake([firstLabel x], CGRectGetMaxY([firstLabel frame]) + margin, self.view.width - 2 * [firstLabel x], 1);
    [self.view addSubview:sepLabel];
}

- (void)addCpLabelWithLabel:(UILabel *)label originFrame:(CGRect)originFrame{
    UILabel *cpLabel = [[UILabel alloc] init];
    cpLabel.tp_text(label.text).tp_font(label.font).
    tp_alignment(ENTextAlighmentCenter).tp_bgColor(label.backgroundColor);
    cpLabel.frame = label.frame;
    [self.view addSubview:cpLabel];
    label.frame = originFrame;
}

- (NSInteger)loopsWithNumber:(NSInteger)number{
    NSInteger count = 1;
    if (number < 10) {
        return count;
    }
    NSInteger temp = number / 10;
    while (temp != 0) {
        temp = temp / 10;
        count++;
    }
    return count;
}

- (NSInteger)maxNumber{
    NSInteger max = 0;
    for (NSInteger i = 0; i < Count; ++i) {
        if (max < [self.examples[i] integerValue]) {
            max = [self.examples[i] integerValue];
        }
    }
    return max;
}

- (NSInteger)positionWithNumber:(NSInteger)number loop:(NSInteger)loop{
    return (number / (NSInteger)pow(10, loop) % 10);
}

- (NSMutableArray *)tempArray{
    if (!_tempArray) {
        _tempArray = [[NSMutableArray alloc] initWithCapacity:self.baseNumbers.count];
        for (NSInteger i = 0; i < self.baseNumbers.count; ++i) {
            NSMutableArray *secondArray = [NSMutableArray array];
            for (NSInteger j = 0; j < colSize; ++j) {
                [secondArray addObject:@""];
            }
            [_tempArray addObject:secondArray];
        }
    }
    return _tempArray;
}

@end
