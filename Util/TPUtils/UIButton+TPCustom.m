//
//  UIButton+TPCustom.m
//  TPFrame
//
//  Created by tangpeng on 2017/10/13.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "UIButton+TPCustom.h"
#import "UIView+TPFrameExtension.h"
#import <objc/message.h>
#define weak __weak typeof(self) weakSelf = self;
static char *tp_imageXKey = "tp_imageX";
static char *tp_imageYKey = "tp_imageY";
static char *tp_imageWKey = "tp_imageW";
static char *tp_imageHKey = "tp_imageH";

static char *tp_labelXKey = "tp_labelX";
static char *tp_labelYKey = "tp_labelY";
static char *tp_labelWKey = "tp_labelW";
static char *tp_labelHKey = "tp_labelH";
@implementation UIButton (TPCustom)

- (CGFloat)tp_imageX{
    return [objc_getAssociatedObject(self, tp_imageXKey) floatValue];
}
- (void)setTp_imageX:(CGFloat)tp_imageX{
    objc_setAssociatedObject(self, tp_imageXKey, @(tp_imageX), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)tp_imageY{
    return [objc_getAssociatedObject(self, tp_imageYKey) floatValue];
}
- (void)setTp_imageY:(CGFloat)tp_imageY{
    objc_setAssociatedObject(self, tp_imageYKey, @(tp_imageY), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)tp_imageW{
    return [objc_getAssociatedObject(self, tp_imageWKey) floatValue];
}
- (void)setTp_imageW:(CGFloat)tp_imageW{
    objc_setAssociatedObject(self, tp_imageWKey, @(tp_imageW), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)tp_imageH{
    return [objc_getAssociatedObject(self, tp_imageHKey) floatValue];
}
- (void)setTp_imageH:(CGFloat)tp_imageH{
    objc_setAssociatedObject(self, tp_imageHKey, @(tp_imageH), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)tp_labelX{
    return [objc_getAssociatedObject(self, tp_labelXKey) floatValue];
}
- (void)setTp_labelX:(CGFloat)tp_labelX{
    objc_setAssociatedObject(self, tp_labelXKey, @(tp_labelX), OBJC_ASSOCIATION_ASSIGN);
}
- (CGFloat)tp_labelY{
    return [objc_getAssociatedObject(self, tp_labelYKey) floatValue];
}
- (void)setTp_labelY:(CGFloat)tp_labelY{
    objc_setAssociatedObject(self, tp_labelYKey, @(tp_labelY), OBJC_ASSOCIATION_ASSIGN);
}
- (CGFloat)tp_labelW{
    return [objc_getAssociatedObject(self, tp_labelWKey) floatValue];
}
- (void)setTp_labelW:(CGFloat)tp_labelW{
    objc_setAssociatedObject(self, tp_labelWKey, @(tp_labelW), OBJC_ASSOCIATION_ASSIGN);
}
- (CGFloat)tp_labelH{
    return [objc_getAssociatedObject(self, tp_labelHKey) floatValue];
}
- (void)setTp_labelH:(CGFloat)tp_labelH{
    objc_setAssociatedObject(self, tp_labelHKey, @(tp_labelH), OBJC_ASSOCIATION_ASSIGN);
}

- (ButtonImageX)imageX{
    weak
    return ^UIButton *(CGFloat imageX){
        weakSelf.imageView.x = imageX;
        weakSelf.tp_imageX = imageX;
        return self;
    };
}

- (ButtonImageY)imageY{
    weak
    return ^UIButton *(CGFloat imageY){
        weakSelf.imageView.y = imageY;
        weakSelf.tp_imageY = imageY;
        return self;
    };
}

- (ButtonImageW)imageW{
    weak
    return ^UIButton *(CGFloat imageW){
        weakSelf.imageView.width = imageW;
        weakSelf.tp_imageW = imageW;
        return self;
    };
}
- (ButtonImageH)imageH{
    weak
    return ^UIButton *(CGFloat imageH){
        weakSelf.imageView.height = imageH;
        weakSelf.tp_imageH = imageH;
        return self;
    };
}

- (ButtonLabelX)labelX{
    weak
    return ^UIButton *(CGFloat labelX){
        weakSelf.titleLabel.x = labelX;
        weakSelf.tp_labelX = labelX;
        return self;
    };
}

- (ButtonLabelY)labelY{
    weak
    return ^UIButton *(CGFloat labelY){
        weakSelf.titleLabel.y = labelY;
        weakSelf.tp_labelY = labelY;
        return self;
    };
}

- (ButtonLabelW)labelW{
    weak
    return ^UIButton *(CGFloat labelW){
        weakSelf.titleLabel.width = labelW;
        weakSelf.tp_labelW = labelW;
        return self;
    };
}
- (ButtonLabelH)labelH{
    weak
    return ^UIButton *(CGFloat labelH){
        weakSelf.titleLabel.height = labelH;
        weakSelf.tp_labelH = labelH;
        return self;
    };
}

- (ButtonNormalImage)normalImage{
    weak
    return ^UIButton *(NSString *imageName){
        [weakSelf setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        return self;
    };
}

- (ButtonSelectedImage)selectedImage{
    weak
    return ^UIButton *(NSString *imageName){
        [weakSelf setImage:[UIImage imageNamed:imageName] forState:UIControlStateSelected];
        return self;
    };
}

- (ButtonHighlightImage)highlightImage{
    weak
    return ^UIButton *(NSString *imageName){
        [weakSelf setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
        return self;
    };
}

- (ButtonNormalBgImage)normalBgImage{
    weak
    return ^UIButton *(NSString *imageName){
        [weakSelf setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        return self;
    };
}
- (ButtonHighlightBgImage)highlightBgImage{
    weak
    return ^UIButton *(NSString *imageName){
        [weakSelf setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
        return self;
    };
}
- (ButtonSelectedBgImage)selectedBgImage{
    weak
    return ^UIButton *(NSString *imageName){
        [weakSelf setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateSelected];
        return self;
    };
}


- (blockNormalTitle)normalTitle{
    weak
    return ^UIButton *(NSString *text){
        [weakSelf setTitle:text forState:UIControlStateNormal];
        return self;
    };
}

- (blockSelectedTitle)selectedTitle{
    weak
    return ^UIButton *(NSString *text){
        [weakSelf setTitle:text forState:UIControlStateSelected];
        return self;
    };
}

- (blockHighLightTitle)highlightTitle{
    weak
    return ^UIButton *(NSString *text){
        [weakSelf setTitle:text forState:UIControlStateHighlighted];
        return self;
    };
}

- (blockButtonFont)titleFont{
    weak
    return ^UIButton *(id font){
        if ([font isKindOfClass:[UIFont class]]) {
            weakSelf.titleLabel.font = font;
        }else if ([font isKindOfClass:[NSNumber class]]){
            weakSelf.titleLabel.font = [UIFont systemFontOfSize:[font integerValue]];
        }
        return self;
    };
}

- (blockNormalTitleColor)normalTitleColor{
    weak
    return ^UIButton *(UIColor *color){
        [weakSelf setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
}

- (blockSelectedTitleColor)selectedTitleColor{
    weak
    return ^UIButton *(UIColor *color){
        [weakSelf setTitleColor:color forState:UIControlStateSelected];
        return self;
    };
}

- (blockHighLightTitleColor)highlightTitleColor{
    weak
    return ^UIButton *(UIColor *color){
        [weakSelf setTitleColor:color forState:UIControlStateHighlighted];
        return self;
    };
}

- (blockBgColor)bgColor{
    weak
    return ^UIButton *(UIColor *color){
        [weakSelf setBackgroundColor:color];
        return self;
    };
}

- (blockCorneradius)corneradius{
    weak
    return ^UIButton *(CGFloat corneradius){
        weakSelf.layer.cornerRadius = corneradius;
        return self;
    };
}
- (blockBorderWidth)borderWidth{
    weak
    return ^UIButton *(CGFloat borderWidth){
        weakSelf.layer.borderWidth = borderWidth;
        return self;
    };
}
- (blockMaskToBounds)maskToBounds{
    weak
    return ^UIButton *(BOOL yes){
        weakSelf.layer.masksToBounds = yes;
        return self;
    };
}
- (blockBorderColor)borderColor{
    weak
    return ^UIButton *(UIColor *color){
        weakSelf.layer.borderColor = color.CGColor;
        return self;
    };
}

- (void)finishL{
    if (self.tp_imageX == 0 || self.tp_labelX == 0) {
        return;
    }
    self.imageView.frame = CGRectMake(self.tp_imageX, self.tp_imageY, self.tp_imageW, self.tp_imageH);
    
    NSLog(@"self.tp_image-frame:%lf,%lf,%lf,%lf",self.tp_imageX,self.tp_imageY,self.tp_imageW,self.tp_imageH);
    
    self.titleLabel.frame = CGRectMake(self.tp_labelX, self.tp_labelY, self.tp_labelW, self.tp_labelH);
    NSLog(@"self.tp_label-frame:%lf,%lf,%lf,%lf",self.tp_labelX,self.tp_labelY,self.tp_labelW,self.tp_labelH);
}


@end
