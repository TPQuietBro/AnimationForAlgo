//
//  ViewController.m
//  AnimationsForAlgo
//
//  Created by 唐鹏 on 2018/9/27.
//  Copyright © 2018 唐鹏. All rights reserved.
//

#import "ViewController.h"
#import "SortViewController.h"
#include<math.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *categories;
@end
static NSString *const ID = @"UITableViewCell";
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"所有类别";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.textLabel.text = self.categories[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:[SortViewController new] animated:YES];
    }
}

- (NSArray *)categories{
    if (!_categories) {
        _categories = @[@"Sort",@"Tree"];
    }
    return _categories;
}


@end
