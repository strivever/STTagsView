# STTagsView
动态标签自动布局
===   

* 使用效果截图   
![列表使用动态标签](https://github.com/strivever/STTagsView/blob/master/STTagsViewDemo/image/IMG_3741.PNG "列表使用动态标签")
![普通动态标签](https://github.com/strivever/STTagsView/blob/master/STTagsViewDemo/image/IMG_3742.PNG "普通动态标签")
* 使用方法   
`
  STTagsView * tagView = [STTagsView tagViewWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 0) tagsArray:@[@"局部变量的生命周期（只到程序结束，这个局部变量才会销毁）",@"变局部变",@"啦啦啦啦绿",@"你是",@"变量才会",@"变量才会",@"你好",@"你是",@"变量才会",@"变量才会",@"你好",@"你是",@"变量才会",@"变量才会",@"你好",@"你是",@"变量才会",@"变量才会",@"你好",@"你是",@"变量才会",@"变量才会",@"你好",@"你是",@"变量才会",@"变量才会",@"你好",@"你是",@"局部变量的生命周期（只到程序结束，这个局部变量才会销毁）",@"变局部变",@"啦啦啦啦绿"] textColor:[UIColor grayColor] textFont:[UIFont systemFontOfSize:14] normalTagBackgroundColor:[UIColor whiteColor] tagBorderColor:[UIColor redColor] contentInsets:UIEdgeInsetsMake(20, 10, 20, 10) labelContentInsets:UIEdgeInsetsMake(5, 15, 5, 15) labelHorizontalSpacing:10 labelVerticalSpacing:10];
`
