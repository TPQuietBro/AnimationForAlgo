//
//  TPScreenAdaptor.h
//  KYTipAlertView
//
//  Created by 唐鹏 on 2017/7/6.
//  Copyright © 2017年 唐鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

#define Width(number)  [TPScreenAdaptor pxWidthWithNumber:number]

#define Height(number)  [TPScreenAdaptor pxHeightWithNumber:number]

@interface TPScreenAdaptor : NSObject
+ (CGFloat)pxWidthWithNumber:(CGFloat)number;
+ (CGFloat)pxHeightWithNumber:(CGFloat)number;
@end
