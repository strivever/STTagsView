//
//  ViewController.m
//  STTagsViewDemo
//
//  Created by StriVever on 2017/9/19.
//  Copyright © 2017年 StriVever. All rights reserved.
//

#import "ViewController.h"
#import "STTagsView.h"
#import "STTagFrameProtocol.h"
#import "STTableViewCell.h"
#import "SecViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView * tableview;
@property (nonatomic, strong) NSMutableArray * data;
@property (nonatomic, strong) NSMutableDictionary * cacheHeight;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cacheHeight = @{}.mutableCopy;
        
    
    self.tableview = [[UITableView alloc]initWithFrame:self.view.bounds];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.tableview registerClass:[STTableViewCell class] forCellReuseIdentifier:@"STTableViewCell"];
    [self.view addSubview:self.tableview];
    self.data = @[@[@"局部变量的生命周期（只到程序结束，这个局部变量才会销毁）",@"变局部变",@"啦啦啦啦绿"],@[@"局部变量的生命周期（只到程序结束，这个局部变量才会销毁）",@"变局部变",@"啦啦啦啦绿"],@[@"局部变量的生命周期（只到程序结束，这个局部变量才会销毁）",@"变局部变",@"啦啦啦啦绿"],@[@"变量才会",@"变量才会",@"你好",@"你是"],@[@"变量才会",@"变量才会",@"你好",@"你是"],@[@"局部变量的生命周期（只到程序结束，这个局部变量才会销毁）",@"变局部变",@"啦啦啦啦绿",@"变量才会",@"变量才会",@"你好",@"你是"],@[@"局部变量的生命周期（只到程序结束，这个局部变量才会销毁）",@"变局部变",@"啦啦啦啦绿"],@[@"局部变量的生命周期（只到程序结束，这个局部变量才会销毁）",@"变局部变",@"啦啦啦啦绿"],@[@"局部变量的生命周期（只到程序结束，这个局部变量才会销毁）",@"变局部变",@"啦啦啦啦绿"],@[@"变量才会",@"变量才会",@"你好",@"你是"],@[@"局部变量的生命周期（只到程序结束，这个局部变量才会销毁）",@"变局部变",@"啦啦啦啦绿"],@[@"局部变量的生命周期（只到程序结束，这个局部变量才会销毁）",@"变局部变",@"啦啦啦啦绿",@"变量才会",@"变量才会",@"你好",@"你是"],@[@"变量才会",@"变量才会",@"你好",@"你是"],@[@"变量才会"],@[@"变量才会",@"变量才会",@"你好",@"你是"],@[@"变量才会",@"变量才会",@"你好",@"你是"],@[@"变量才会",@"变量才会",@"你好",@"局部变量的生命周期（只到程序结束，这个局部变量才会销毁）",@"变局部变",@"啦啦啦啦绿"],@[@"局部变量的生命周期（只到程序结束，这个局部变量才会销毁）",@"变局部变",@"啦啦啦啦绿",@"你是",@"变量才会",@"变量才会",@"你好",@"你是",@"变量才会",@"变量才会",@"你好",@"你是",@"变量才会",@"变量才会",@"你好",@"你是",@"变量才会",@"变量才会",@"你好",@"你是",@"变量才会",@"变量才会",@"你好",@"你是",@"变量才会",@"变量才会",@"你好",@"你是",@"局部变量的生命周期（只到程序结束，这个局部变量才会销毁）",@"变局部变",@"啦啦啦啦绿"],@[@"局部变量的生命周期（只到程序结束，这个局部变量才会销毁）",@"变局部变",@"啦啦啦啦绿",@"变量才会",@"变量才会",@"你好",@"你是",@"变量才会",@"变量才会",@"你好",@"你是",@"变量才会",@"变量才会",@"你好",@"你是",@"变量才会",@"变量才会",@"你好",@"你是",@"变量才会",@"变量才会",@"你好",@"你是"],@[@"变量才会",@"变量才会",@"你好",@"你是"],@[@"变量才会",@"变量才会",@"你好",@"你是"]].mutableCopy;
    
    for (int i = 0; i < 5; i ++) {
        NSArray * temp = self.data.copy;
        [self.data addObjectsFromArray:temp];
    }
    [self.tableview reloadData];
    
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, self.view.frame.size.height - 100, 150, 60);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"普通标签" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(demo2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup af
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)demo2{
    SecViewController * vc = [SecViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    _tableview.frame = self.view.bounds;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark ---UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    STTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"STTableViewCell"];
    if (!cell) {
        cell = [[STTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"STTableViewCell"];
    }
    cell.data = self.data[indexPath.row];
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray * dataArray = self.data[indexPath.row];
    CGFloat height = [self.cacheHeight[[NSString stringWithFormat:@"%ld_%f",(long)indexPath.row,self.view.frame.size.width]] floatValue];
    if (height < 1) {
        height = [STTableViewCell heightForCellWithDataArray:dataArray];
        [self.cacheHeight setObject:@(height) forKey:[NSString stringWithFormat:@"%ld_%f",(long)indexPath.row,self.view.frame.size.width]];
    }
    return height;
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
#pragma mark ---UITableViewDelegate

@end
