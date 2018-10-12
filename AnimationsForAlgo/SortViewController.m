//
//  SortViewController.m
//  AnimationsForAlgo
//
//  Created by 唐鹏 on 2018/9/27.
//  Copyright © 2018 唐鹏. All rights reserved.
//

#import "SortViewController.h"

@interface SortViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tabelView;
@property (nonatomic, strong) NSArray *sorts;
@property (nonatomic, strong) NSDictionary *sortVcDict;
@end

static NSString *const ID = @"id";
@implementation SortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"所有排序算法";
    [self.tabelView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.sorts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.textLabel.text = self.sorts[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *targetVcString = self.sortVcDict[@(indexPath.row)];
    id targetVc = [[NSClassFromString(targetVcString) alloc] init];
    if ([targetVc isKindOfClass:[UIViewController class]]) {
        [self.navigationController pushViewController:targetVc animated:YES];
    } else {
        NSAssert(targetVc, @"targetVc is not a UIViewController");
    }
}
#pragma mark - getter
- (NSDictionary *)sortVcDict{
    if (!_sortVcDict) {
        _sortVcDict = @{@(0) : @"BubbleViewController",
                        @(1) : @"InsertViewController",
                        @(2) : @"SelectViewController",
                        @(3) : @"ShellViewController",
                        @(4) : @"RadixViewController",
                        @(5) : @"MergeViewController",
                        @(6) : @"HeapViewController",
                        @(7) : @"QuickViewController"
                        };
    }
    return _sortVcDict;
}

- (NSArray *)sorts{
    if (!_sorts) {
        _sorts = @[@"bubble",@"insert",@"select",@"shell",@"radix",@"merge",@"heap",@"quick"];
    }
    return _sorts;
}

@end
