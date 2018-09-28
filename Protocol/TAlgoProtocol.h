//
//  TAlgoProtocol.h
//  AnimationsForAlgo
//
//  Created by 唐鹏 on 2018/9/28.
//  Copyright © 2018 唐鹏. All rights reserved.
//

@protocol TAlgoProtocol<NSObject>
- (void)beginAnimation;
- (void)startTimer;
- (void)fireTimer;
- (void)reSetLabelBg;
- (void)swapArray:(NSMutableArray *)array firstIndex:(NSInteger)first secondIndex:(NSInteger)second;
@optional
- (void)sort;
- (void)afterSorted;
- (NSTimeInterval)duration;
@end
