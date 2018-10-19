//
//  BaseSortAlgoViewController.m
//  AnimationsForAlgo
//
//  Created by 唐鹏 on 2018/9/28.
//  Copyright © 2018 唐鹏. All rights reserved.

#import "BaseSortAlgoViewController.h"

@interface BaseSortAlgoViewController ()
@end
@implementation BaseSortAlgoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = [[ControllerInfoManager sharedInstance] sortTitleWithController:self];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self initCustomBackButton];
    [self startTimer];
    self.defaultBgColor = [UIColor colorWithRed:79/255.0 green:167/255.0 blue:246/255.0 alpha:1];
    self.defaultTextColor = [UIColor whiteColor];
    self.defaultFont = [UIFont boldSystemFontOfSize:13];
    [self initLabels];
}

- (void)initCustomBackButton{
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(popVc) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)popVc{
}

- (void)dealloc{
    [self fireTimer];
}

- (void)initLabels{
    CGFloat leftMargin = 30;
    CGFloat labelMargin = (self.view.frame.size.width - self.examples.count * width - leftMargin * 2) / (self.examples.count - 1);
    
    for (NSInteger i = 0; i < self.examples.count; ++i) {
        UILabel *numLable = [[UILabel alloc] init];
        numLable.tp_font(self.defaultFont).tp_text(self.examples[i]).tp_customTextColor(self.defaultTextColor).tp_alignment(ENTextAlighmentCenter);
        numLable.tp_bgColor(self.defaultBgColor);
        numLable.frame = CGRectMake(leftMargin + i * (width + labelMargin), 100, width, height);
        [self.view addSubview:numLable];
        [self.labels addObject:numLable];
    }
}

- (void)startTimer{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:Duration target:self selector:@selector(beginAnimation) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    _timer = timer;
}

- (void)beginAnimation{
    
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

- (NSTimeInterval)duration{
    return 0;
}

- (void)reSetLabelBg{
    for (UILabel *label in self.labels) {
        label.backgroundColor = self.defaultBgColor;
    }
}

- (void)afterSorted{
    NSMutableString *string = [NSMutableString string];
    for (id number in _examples) {
        [string appendString:[NSString stringWithFormat:@"%@ ",number]];
    }
    NSLog(@"after sorted : %@",string);
}

- (void)fireTimer{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
        NSLog(@"timer is invalidated");
    }
}

#pragma mark - getter
- (NSMutableArray *)examples{
    if (!_examples) {
        _examples = [@[@"49",@"38",@"65",@"97",@"76",@"13",@"27",@"49",@"55",@"04"] mutableCopy];
    }
    return _examples;
}
- (NSMutableArray *)labels{
    if (!_labels) {
        _labels = [[NSMutableArray alloc] init];
    }
    return _labels;
}

@end
