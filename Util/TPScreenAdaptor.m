//
//  TPScreenAdaptor.m
//  KYTipAlertView
//
//  Created by 唐鹏 on 2017/7/6.
//  Copyright © 2017年 唐鹏. All rights reserved.
//

#import "TPScreenAdaptor.h"
#define isIPhone5 [UIScreen mainScreen].bounds.size.height == 568
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH  ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5_ (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)


#define IPHONE_4_HEIGHT_PX 960.0
#define IPHONE_5_HEIGHT_PX 1136.0
#define IPHONE_6_HEIGHT_PX 1334.0
#define IPHONE_6P_HEIGHT_PX 1920.0

#define IPHONE_5_WIDTH_PX 640.0
#define IPHONE_6_WIDTH_PX 750.0
#define IPHONE_6P_WIDTH_PX 1080.0
#define IS_IPHONE_X (IS_IPHONE && SCREEN_MAX_LENGTH == 812.0)
@implementation TPScreenAdaptor
+ (CGFloat)pxWidthWithNumber:(CGFloat)number{
    
    CGFloat width = 0;
    if (IS_IPHONE_5_ || IS_IPHONE_4_OR_LESS) {
        //iphone4/5有些特殊,需要像素点的1/2.5倍才会比较合适
        width = number / 2.5;
    }else if (IS_IPHONE_6){
        width = SCREEN_WIDTH / IPHONE_6_WIDTH_PX * number;
    }else if (IS_IPHONE_6P){
        width = SCREEN_WIDTH / IPHONE_6_WIDTH_PX * number;
    }else if (IS_IPHONE_X) {
        width = SCREEN_WIDTH / IPHONE_6_WIDTH_PX * number;
    }
    return width;
}
+ (CGFloat)pxHeightWithNumber:(CGFloat)number{
    
    CGFloat height = 0;
    if (IS_IPHONE_4_OR_LESS || IS_IPHONE_5_) {
        height = number / 2.5;
    }else if (IS_IPHONE_6){
        height = SCREEN_WIDTH / IPHONE_6_WIDTH_PX * number;
    }else if (IS_IPHONE_6P){
        height = SCREEN_WIDTH / IPHONE_6_WIDTH_PX * number;
    }else if (IS_IPHONE_X) {
        height = SCREEN_WIDTH / IPHONE_6_WIDTH_PX * number;
    }
    return height;
}
@end
