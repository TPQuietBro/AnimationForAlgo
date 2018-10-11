//
//  SortViewController.m
//  AnimationsForAlgo
//
//  Created by 唐鹏 on 2018/9/27.
//  Copyright © 2018 唐鹏. All rights reserved.
//

#import "SortViewController.h"
#import "BubbleViewController.h"
#import "InsertViewController.h"
#import "SelectViewController.h"
#import "ShellViewController.h"
#import "RadixViewController.h"
#import "MergeViewController.h"
#import "HeapViewController.h"
#import "QuickViewController.h"

@interface SortViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tabelView;
@property (nonatomic, strong) NSArray *sorts;
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
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:[BubbleViewController new] animated:YES];
    } else if (indexPath.row == 1){
        [self.navigationController pushViewController:[InsertViewController new] animated:YES];
    } else if (indexPath.row == 2){
        [self.navigationController pushViewController:[SelectViewController new] animated:YES];
    } else if (indexPath.row == 3){
        [self.navigationController pushViewController:[ShellViewController new] animated:YES];
    } else if (indexPath.row == 4){
        [self.navigationController pushViewController:[RadixViewController new] animated:YES];
    } else if (indexPath.row == 5){
        [self.navigationController pushViewController:[MergeViewController new] animated:YES];
    } else if (indexPath.row == 6){
        [self.navigationController pushViewController:[HeapViewController new] animated:YES];
    } else if (indexPath.row == 7){
        [self.navigationController pushViewController:[QuickViewController new] animated:YES];
    }
    
}

- (NSArray *)sorts{
    if (!_sorts) {
        _sorts = @[@"bubble",@"insert",@"select",@"shell",@"radix",@"merge",@"heap",@"quick"];
    }
    return _sorts;
}

@end
