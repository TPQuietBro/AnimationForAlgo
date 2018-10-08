//
//  RadixViewController.m
//  AnimationsForAlgo
//
//  Created by 唐鹏 on 2018/10/8.
//  Copyright © 2018 唐鹏. All rights reserved.
//

#import "RadixViewController.h"
#import "TPFrame.h"

#define firstLabel self.labels.firstObject

@interface RadixViewController ()
@property (nonatomic, assign) NSInteger maxNumber;
@property (nonatomic, assign) NSInteger loops;
@property (nonatomic, strong) NSArray *baseNumbers;
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
}

- (void)beginAnimation{
    
}

- (void)sort{
    
}

- (void)popVc{
    [self.navigationController popViewControllerAnimated:YES];
    [self fireTimer];
}

#pragma mark - private

- (void)initBaseNumberLabels{
    CGFloat labelMargin = 5;
    CGFloat topMargin = 15;
    
    for (NSInteger i = 0; i < self.baseNumbers.count; ++i) {
        UILabel *label = [[UILabel alloc] init];
        label.tp_text(self.baseNumbers[i]).tp_font(@12).tp_alignment(ENTextAlighmentCenter)
        .tp_systemTextColor(ENRedColor).tp_bgColor([UIColor whiteColor]);
        label.frame = CGRectMake([firstLabel x], CGRectGetMaxY([firstLabel frame]) + topMargin + i * (height  + labelMargin), width, height);
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

@end
