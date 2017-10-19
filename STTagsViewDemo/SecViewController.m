//
//  SecViewController.m
//  STTagsViewDemo
//
//  Created by StriVever on 2017/10/19.
//  Copyright © 2017年 StriVever. All rights reserved.
//

#import "SecViewController.h"
#import "STTagsView.h"
@interface SecViewController ()
@property (nonatomic, strong)STTagsView * tagView;
@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //局部变量的生命周期（只到程序结束，这个局部变量才会销毁）
    STTagsView * tagView = [STTagsView tagViewWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 0) tagsArray:@[@"局部变量的生命周期（只到程序结束，这个局部变量才会销毁）",@"变局部变",@"啦啦啦啦绿",@"你是",@"变量才会",@"变量才会",@"你好",@"你是",@"变量才会",@"变量才会",@"你好",@"你是",@"变量才会",@"变量才会",@"你好",@"你是",@"变量才会",@"变量才会",@"你好",@"你是",@"变量才会",@"变量才会",@"你好",@"你是",@"变量才会",@"变量才会",@"你好",@"你是",@"局部变量的生命周期（只到程序结束，这个局部变量才会销毁）",@"变局部变",@"啦啦啦啦绿"] textColor:[UIColor grayColor] textFont:[UIFont systemFontOfSize:14] normalTagBackgroundColor:[UIColor whiteColor] tagBorderColor:[UIColor redColor] contentInsets:UIEdgeInsetsMake(20, 10, 20, 10) labelContentInsets:UIEdgeInsetsMake(5, 15, 5, 15) labelHorizontalSpacing:10 labelVerticalSpacing:10];
    [self.view addSubview:tagView];
    
    _tagView = tagView;
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, self.view.frame.size.height - 100, 1230, 60);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"添加标签" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(addTag) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view.
}
- (void)addTag{
    [_tagView addTag:@"你是变量的生命周期局部变量的生命周期局部变量的生命周期局部变量的生命周期局部变量的生命周期局部变量的生命周期病啊黑呵呵"];
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    _tagView.frame = CGRectMake(0, 100, self.view.frame.size.width, 0);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
