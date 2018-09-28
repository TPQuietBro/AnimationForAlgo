//
//  TPCustomLabel.h
//  Meum
//
//  Created by tangpeng on 2017/10/11.
//  Copyright © 2017年 tangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TPCustomLabel : UILabel
@property (nonatomic, assign) UIEdgeInsets textInsets;
- (instancetype)initWithInsets:(UIEdgeInsets)inset;
@end
