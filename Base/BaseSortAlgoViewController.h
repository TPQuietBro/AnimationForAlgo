//
//  BaseSortAlgoViewController.h
//  AnimationsForAlgo
//
//  Created by 唐鹏 on 2018/9/28.
//  Copyright © 2018 唐鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TAlgoProtocol.h"
#import "UILabel+FastSetting.h"
#import "ControllerInfoManager.h"

#define Duration [self duration] > 0 ? : 0.5
#define Count self.examples.count

static CGFloat width = 25;
static CGFloat height = 35;

@interface BaseSortAlgoViewController : UIViewController<TAlgoProtocol>
@property (nonatomic, strong) NSMutableArray *examples;
@property (nonatomic, strong) NSMutableArray *labels;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger i; 
@property (nonatomic, assign) NSInteger j;
@property (nonatomic, assign) NSInteger k;
@property (nonatomic, strong) UIColor *defaultBgColor;
@property (nonatomic, strong) UIColor *defaultTextColor;
@property (nonatomic, strong) UIFont *defaultFont;
@end
