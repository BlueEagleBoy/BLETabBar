# BLETabBar
封装一个TabBar 几行代码实现自定义tabBar的使用

###前言：
   自定义一个tabBar，对tabBar进行了封装，方便使用，只需要传送给tabBar标题数组或者图片数组就可以完成tabBar中item的创建并数据赋值。
   
###提供的接口：
   
```

@property (nonatomic, strong)NSArray *images; //设置图片 如果item为空会创建item
@property (nonatomic, strong)NSArray *titles; //设置标题 如果item为空会创建item
@property (nonatomic, copy)void (^myBlock)(NSInteger); //点击item的回调block

// 设置不同状态下的item颜色 之后在item创建结束后才能使用
- (void)setupButtonNormalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor;

//设置图片 只需要穿入一个普通状态下图片数组 如果没有创建item会自动创建item
- (void)setupButtonWithNormalImageNames:(NSArray *)normalNames withSelectedSuffix:(NSString *)selectedSuf withBackgroundSuffix:(NSString *)backgroundSuf;

```

###tabBar的使用步骤：

1.初始化一个tabBar

```
 //添加Tabbar
 BLETabBar *tabBar = [[BLETabBar alloc]initWithFrame:self.tabBar.frame];

```

2.根据数据 创建item

  * 如果有title就穿入标题数组
  
  ```
  tabBar.titles = @[@"发现",@"扫描",@"我的"];
  
  ```
  
  * 如果有普通图片 穿入图片数组
  
  ```
  tabBar.images = @[@"find_button_image",@"scan_button_image",@"my_button_image"];
  
  ```
  
  * 如果既要设置普通图片又要设置选中图片或者背景图片 如果图片状态之间只有后缀不通 就可以使用此方法 
  
  ```
   //给控件添加图片
    [tabBar setupButtonWithNormalImageNames:images withSelectedSuffix:@"_select" withBackgroundSuffix:nil];
    
  ```

3.集体设置不同状态下item的颜色

```
  //设置tabbar的字体颜色
    [tabBar setupButtonNormalColor:[UIColor lightGrayColor] selectedColor:[UIColor orangeColor]];

```

4.添加tabbar到指定的位置 并要实现tabbar的点击的回调block

```

 [self.view addSubview:tabBar];
    
    self.selectedIndex = 0;
    
    tabBar.myBlock = ^(NSInteger selectedIndex){
       
        DLog(@"%ld",selectedIndex);
        self.selectedIndex = selectedIndex;
    };


```

5.运行 

