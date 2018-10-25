//
//  ControllerInfoManager.m
//  AnimationsForAlgo
//
//  Created by 唐鹏 on 2018/10/12.
//  Copyright © 2018 唐鹏. All rights reserved.
//

#import "ControllerInfoManager.h"

@implementation ControllerInfoManager

+ (instancetype)sharedInstance{
    static ControllerInfoManager *single = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        single = [[self alloc] init];
    });
    return single;
}

- (NSString *)sortTitleWithController:(UIViewController *)controller{
    NSString *vcName = NSStringFromClass([controller class]);
    NSString *title = [self vcTitleDict][vcName];
    NSAssert(title, @"title is not exist");
    return title;
}

- (NSDictionary *)vcTitleDict{
    NSMutableDictionary *tempDict = [NSMutableDictionary dictionary];
    if (self.vcNames.count == self.sortTitles.count) {
        [self.vcNames enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [tempDict setObject:self.sortTitles[idx] forKey:obj];
        }];
    }
    return [tempDict copy];
}

- (NSDictionary *)sortSelectVcDict{
    if (!_sortSelectVcDict) {
        NSMutableDictionary *tempDict = [NSMutableDictionary dictionary];
        [self.vcNames enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [tempDict setObject:obj forKey:@(idx)];
        }];
        _sortSelectVcDict = tempDict;
    }
    return _sortSelectVcDict;
}

- (NSArray *)vcNames{
    if (!_vcNames) {
        _vcNames = @[@"BubbleViewController",@"InsertViewController",@"SelectViewController",@"ShellViewController",@"RadixViewController",@"MergeViewController",@"HeapViewController",@"QuickViewController"];
    }
    return _vcNames;
}

- (NSArray *)sortTitles{
    if (!_sortTitles) {
        _sortTitles = @[@"bubble",@"insert",@"select",@"shell",@"radix",@"merge",@"heap",@"quick"];
    }
    return _sortTitles;
}

- (NSArray *)categories{
    if (!_categories) {
        _categories = @[@"Sort",@"Tree"];
    }
    return _categories;
}
@end
