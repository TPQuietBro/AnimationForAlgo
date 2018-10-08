//
//  RadixViewController.m
//  AnimationsForAlgo
//
//  Created by 唐鹏 on 2018/10/8.
//  Copyright © 2018 唐鹏. All rights reserved.
//

#import "RadixViewController.h"
#import "TPFrame.h"
static NSInteger colSize = 20;
#define firstLabel self.labels.firstObject

@interface RadixViewController ()
@property (nonatomic, assign) NSInteger maxNumber;
@property (nonatomic, assign) NSInteger loops;
@property (nonatomic, strong) NSArray *baseNumbers;
@property (nonatomic, strong) NSMutableArray *tempArray;
@end

@implementation RadixViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"基数排序";
    self.maxNumber = [self maxNumber];
    self.loops = [self loopsWithNumber:self.maxNumber];
    self.baseNumbers = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    
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
        [self.tempArray[rowIndex] replaceObjectAtIndex:self.k withObject:self.examples[self.i]];
        self.i ++;
        self.k = 0;
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
    }
    
    CGFloat rowTopMargin = 15;
    for (NSInteger j = 0; j < self.loops; ++j) {
        UILabel *label = [[UILabel alloc] init];
        label.tp_text([NSString stringWithFormat:@"%zd",j]).tp_font(@12).tp_alignment(ENTextAlighmentCenter)
        .tp_bgColor([UIColor whiteColor]);
        label.frame = CGRectMake([firstLabel x] + width + labelMargin + (width + labelMargin) * j, CGRectGetMaxY([firstLabel frame]) + rowTopMargin , width, height);
        [self.view addSubview:label];
    }
    
}

- (void)addSepLine{
    CGFloat margin = 7.5;
    UILabel *sepLabel = [[UILabel alloc] init];
    sepLabel.tp_bgColor([UIColor orangeColor]);
    sepLabel.frame = CGRectMake([firstLabel x], CGRectGetMaxY([firstLabel frame]) + margin, self.view.width - 2 * [firstLabel x], 1);
    [self.view addSubview:sepLabel];
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
