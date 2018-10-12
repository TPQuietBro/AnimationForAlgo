//
//  UIButton+TPCustom.h
//  TPFrame
//
//  Created by tangpeng on 2017/10/13.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef UIButton *(^ButtonImageX)(CGFloat imageX);
typedef UIButton *(^ButtonImageY)(CGFloat imageY);
typedef UIButton *(^ButtonImageW)(CGFloat imageW);
typedef UIButton *(^ButtonImageH)(CGFloat imageH);

typedef UIButton *(^ButtonLabelX)(CGFloat labelX);
typedef UIButton *(^ButtonLabelY)(CGFloat labelY);
typedef UIButton *(^ButtonLabelW)(CGFloat labelW);
typedef UIButton *(^ButtonLabelH)(CGFloat labelH);

typedef UIButton *(^ButtonNormalImage)(NSString *imageName);
typedef UIButton *(^ButtonHighlightImage)(NSString *imageName);
typedef UIButton *(^ButtonSelectedImage)(NSString *imageName);

typedef UIButton *(^ButtonNormalBgImage)(NSString *imageName);
typedef UIButton *(^ButtonHighlightBgImage)(NSString *imageName);
typedef UIButton *(^ButtonSelectedBgImage)(NSString *imageName);

typedef UIButton *(^blockNormalTitle)(NSString *string);
typedef UIButton *(^blockHighLightTitle)(NSString *string);
typedef UIButton *(^blockSelectedTitle)(NSString *string);
typedef UIButton *(^blockButtonFont)(id font);
typedef UIButton *(^blockBgColor)(UIColor *bgColor);
typedef UIButton *(^blockHighLightTitleColor)(UIColor *titleColor);
typedef UIButton *(^blockNormalTitleColor)(UIColor *titleColor);
typedef UIButton *(^blockSelectedTitleColor)(UIColor *titleColor);

typedef UIButton *(^blockCorneradius)(CGFloat corneradius);
typedef UIButton *(^blockBorderWidth)(CGFloat width);
typedef UIButton *(^blockBorderColor)(UIColor *color);
typedef UIButton *(^blockMaskToBounds)(BOOL yes);

@interface UIButton (TPCustom)
@property(nonatomic,assign) CGFloat tp_imageX;
@property(nonatomic,assign) CGFloat tp_imageY;
@property(nonatomic,assign) CGFloat tp_imageW;
@property(nonatomic,assign) CGFloat tp_imageH;

@property(nonatomic,assign) CGFloat tp_labelX;
@property(nonatomic,assign) CGFloat tp_labelY;
@property(nonatomic,assign) CGFloat tp_labelW;
@property(nonatomic,assign) CGFloat tp_labelH;
/*
 * 图片的frame
 */
- (ButtonImageX)imageX;
- (ButtonImageY)imageY;
- (ButtonImageW)imageW;
- (ButtonImageH)imageH;
/*
 * 文字的frame
 */
- (ButtonLabelX)labelX;
- (ButtonLabelY)labelY;
- (ButtonLabelW)labelW;
- (ButtonLabelH)labelH;
/*
 * 图片
 */
- (ButtonNormalImage)normalImage;
- (ButtonHighlightImage)highlightImage;
- (ButtonSelectedImage)selectedImage;

- (ButtonNormalBgImage)normalBgImage;
- (ButtonHighlightBgImage)highlightBgImage;
- (ButtonSelectedBgImage)selectedBgImage;

//普通标题
- (blockNormalTitle)normalTitle;
//高亮标题
- (blockHighLightTitle)highlightTitle;
//选中标题
- (blockSelectedTitle)selectedTitle;
//字体
- (blockButtonFont)titleFont;
//背景颜色
- (blockBgColor)bgColor;
//普通下字体颜色
- (blockNormalTitleColor)normalTitleColor;
//选中后的字体颜色
- (blockSelectedTitleColor)selectedTitleColor;
//高亮下的字体颜色
- (blockHighLightTitleColor)highlightTitleColor;

- (blockCorneradius)corneradius;
- (blockBorderWidth)borderWidth;
- (blockMaskToBounds)maskToBounds;
- (blockBorderColor)borderColor;


- (void)finishL;
@end
