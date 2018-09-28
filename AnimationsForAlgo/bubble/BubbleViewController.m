//
//  BubbleViewController.m
//  AnimationsForAlgo
//
//  Created by 唐鹏 on 2018/9/27.
//  Copyright © 2018 唐鹏. All rights reserved.
//

#import "BubbleViewController.h"
#import "UILabel+FastSetting.h"
@interface BubbleViewController ()
@property (nonatomic, strong) NSMutableArray *examples;
@property (nonatomic, strong) NSMutableArray *labels;
@property (nonatomic, strong) NSTimer *timer;
@end
static NSTimeInterval duration = 0.5;
@implementation BubbleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"bubble";
    self.view.backgroundColor = [UIColor whiteColor];
    _examples = [@[@"49",@"38",@"65",@"97",@"76",@"13",@"27",@"49",@"55",@"04"] mutableCopy];
    [self initLabels];
//    [self sort];
    [self startTimer];
}

- (void)startTimer{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:duration target:self selector:@selector(beginAnimation) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    _timer = timer;
}
NSInteger i = 0;
NSInteger j = 0;
- (void)beginAnimation{
    if (j == self.examples.count - 1) {
        [self afterSorted];
        [self fireTimer];
        return;
    }
    if (i == self.examples.count - j - 1) {
        i = 0;
        j ++;
        [self reSetLabelBg];
        return;
    }
    UILabel *label = self.labels[i];
    label.backgroundColor = [UIColor redColor];
    if (i != 0) {
        UILabel *label = self.labels[i - 1];
        label.backgroundColor = [UIColor whiteColor];
    }
    if ([self.examples[i] integerValue] > [self.examples[i+1] integerValue]) {
        [self fireTimer];
        [UIView animateWithDuration:duration animations:^{
            [self swapArray:self.examples firstIndex:i secondIndex:i+1];
        }completion:^(BOOL finished) {
            [self startTimer];
        }];
    }
    i++;
}

- (void)reSetLabelBg{
    for (UILabel *label in self.labels) {
        label.backgroundColor = [UIColor whiteColor];
    }
}

- (void)fireTimer{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

- (void)initLabels{
    CGFloat leftMargin = 10;
    CGFloat width = 20;
    CGFloat height = 25;
    for (NSInteger i = 0; i < self.examples.count; ++i) {
        UILabel *numLable = [[UILabel alloc] init];
        numLable.tp_font(@12).tp_text(self.examples[i]).tp_systemTextColor(ENBlackColor).tp_alignment(ENTextAlighmentCenter);
        numLable.frame = CGRectMake(leftMargin + i * width, 100, width, height);
        [self.view addSubview:numLable];
        [self.labels addObject:numLable];
    }
}

- (void)sort{
    for (NSInteger i = 0; i < self.examples.count; ++i) {
        for (NSInteger j = 0; j < self.examples.count - 1 - i; ++j) {
            if ([self.examples[j] integerValue] > [self.examples[j+1] integerValue]) {
                [self swapArray:self.examples firstIndex:j secondIndex:j+1];
            }
        }
    }
}

- (void)afterSorted{
    NSMutableString *string = [NSMutableString string];
    for (id number in _examples) {
        [string appendString:[NSString stringWithFormat:@"%@ ",number]];
    }
    NSLog(@"%@",string);
}

- (void)swapArray:(NSMutableArray *)array firstIndex:(NSInteger)first secondIndex:(NSInteger)second{
    id temp;
    temp = array[first];
    array[first] = array[second];
    array[second] = temp;
    
    [self swapLabelWithFirstIndex:first secondIndex:second];
}

- (void)swapLabelWithFirstIndex:(NSInteger)first secondIndex:(NSInteger)second{

    UILabel *firstLabel = self.labels[first];
    UILabel *secondLabel = self.labels[second];
    CGRect tempFrame = firstLabel.frame;
    firstLabel.frame = secondLabel.frame;
    secondLabel.frame = tempFrame;
    
    [self.labels replaceObjectAtIndex:first withObject:secondLabel];
    [self.labels replaceObjectAtIndex:second withObject:firstLabel];

}

- (NSMutableArray *)labels{
    if (!_labels) {
        _labels = [[NSMutableArray alloc] init];
    }
    return _labels;
}
@end
