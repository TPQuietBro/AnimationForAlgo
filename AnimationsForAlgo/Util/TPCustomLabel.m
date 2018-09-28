//
//  TPCustomLabel.m
//  Meum
//
//  Created by tangpeng on 2017/10/11.
//  Copyright © 2017年 tangpeng. All rights reserved.
//

#import "TPCustomLabel.h"

@implementation TPCustomLabel

#pragma mark - init methods

- (instancetype)initWithInsets:(UIEdgeInsets)inset{
    if (self = [super init]) {
        _textInsets = inset;
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect {
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, _textInsets)];
}

#pragma mark - system delegate

#pragma mark - custom delegate

#pragma mark - api methods

#pragma mark - event response

#pragma mark - private

#pragma mark - getter / setter

@end
