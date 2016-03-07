//
//  BLETabBarController.m
//  LoginPage
//
//  Created by BlueEagleBoy on 16/3/7.
//  Copyright © 2016年 BlueEagleBoy. All rights reserved.
//

#import "BLETabBarController.h"
#import "BLETabBar.h"
#import "Masonry.h"
#import "UIView+Frame.h"
#import "BLEFindCollectionController.h"
#import "BLEScanController.h"
#import "BLEProfileController.h"


@interface BLETabBarController ()

@property (nonatomic, strong)BLETabBar *customTabBar;

@end

@implementation BLETabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    BLEFindCollectionController *findVc = [[BLEFindCollectionController alloc]initWithCollectionViewLayout:flowLayout];
    
    BLEScanController *scanVc = [[BLEScanController alloc]init];
    
    BLEProfileController *profileVc = [[BLEProfileController alloc]init];
    
    [self addChildViewController:findVc];
    [self addChildViewController:scanVc];
    [self addChildViewController:profileVc];
    self.selectedIndex = 0;
    
    
    //添加Tabbar
    BLETabBar *tabBar = [[BLETabBar alloc]initWithFrame:self.tabBar.frame];
    
    tabBar.titles = @[@"发现",@"扫描",@"我的"];
    NSArray *images = @[@"find_button_image",@"scan_button_image",@"my_button_image"];
    
    //给控件添加图片
    [tabBar setupButtonWithNormalImageNames:images withSelectedSuffix:@"_select" withBackgroundSuffix:nil];
    
    //设置tabbar的字体颜色
    [tabBar setupButtonNormalColor:[UIColor lightGrayColor] selectedColor:[UIColor orangeColor]];
    
    
    [self.view addSubview:tabBar];
    
    self.selectedIndex = 0;
    
    tabBar.myBlock = ^(NSInteger selectedIndex){
       
        DLog(@"%ld",selectedIndex);
        self.selectedIndex = selectedIndex;
    };
    
}


@end
