//
//  ControllerInfoManager.h
//  AnimationsForAlgo
//
//  Created by 唐鹏 on 2018/10/12.
//  Copyright © 2018 唐鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ControllerInfoManager : NSObject
+ (instancetype)sharedInstance;
@property (nonatomic, strong) NSArray *categories;
@property (nonatomic, strong) NSDictionary *sortSelectVcDict;
@property (nonatomic, strong) NSArray *vcNames;
@property (nonatomic, strong) NSArray *sortTitles;
- (NSString *)sortTitleWithController:(UIViewController *)controller;
@end
