//
//  BaseAlgoViewController.h
//  AnimationsForAlgo
//
//  Created by 唐鹏 on 2018/9/28.
//  Copyright © 2018 唐鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TAlgoProtocol.h"

#define Duration [self duration] > 0 ? : 0.5
#define Count self.examples.count

static NSInteger i = 0;
static NSInteger j = 0;

@interface BaseAlgoViewController : UIViewController<TAlgoProtocol>
@property (nonatomic, strong) NSMutableArray *examples;
@property (nonatomic, strong) NSMutableArray *labels;
@property (nonatomic, strong) NSTimer *timer;
@end
