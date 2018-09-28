//
//  UILabel+FastSetting.h
//  链式编程demo
//
//  Created by ccpg_it on 17/2/17.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LabelLayoutType)
{
    ENTextAlighmentLeft = 0,
    ENTextAlighmentRight = 1,
    ENTextAlighmentCenter = 2
};

typedef NS_ENUM(NSInteger, LabelColor)
{
    ENRedColor = 0,
    ENBlueColor = 1,
    ENPurpleColor = 2,
    ENBrownColor = 3,
    ENGreenColor = 4,
    ENOrangeColor = 5,
    ENYellowColor = 6,
    ENWhiteColor = 7,
    ENBlackColor = 8
};


typedef UILabel *(^blockText)(NSString *string);
typedef UILabel *(^blockFont)(id font);
typedef UILabel *(^blockColor)(UIColor* color);
typedef UILabel *(^blockSystemBlock)(LabelColor color);
typedef UILabel *(^blockLabelBgColor)(UIColor* color);
typedef UILabel *(^blockTextAlignment)(LabelLayoutType alignment);

@interface UILabel (FastSetting)
//设置text
- (blockText)tp_text;
//设置字体
- (blockFont)tp_font;
//设置自定义字体颜色
- (blockColor)tp_customTextColor;
//设置字体为系统颜色
- (blockSystemBlock)tp_systemTextColor;
//设置背景颜色
- (blockLabelBgColor)tp_bgColor;
//设置布局
- (blockTextAlignment)tp_alignment;
//根据text,font获取宽度
- (CGFloat)tp_textWidth;
//根据text,font获取高度
- (CGFloat)tp_textHeight;
//判断是否有数字
- (BOOL)deptNumInputShouldNumber:(NSString *)str;

@end
