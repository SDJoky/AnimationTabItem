//
//  UITabBarController+SDExtension.m
//  LiveTele
//
//  Created by golomee on 16/5/19.
//  Copyright © 2016年 Golomee. All rights reserved.
//

#import "UITabBarController+SDExtension.h"
#import "SDNavigationController.h"
#import "TabItemImgView.h"
#import "UITabBarItem+SDTabbarItem.h"

@implementation UITabBarController (SDExtension)

//为标签栏控制器添加一个界面, cls传入界面对应的类
-(id)addViewControlerWithClass:(Class )cls
                         title:(NSString *)title
                         image:(NSString *)image
                   selectImage:(NSString *)selectImage
{
    //创建一个界面(包含导航)
    UIViewController *vc = [[cls alloc] init];
    vc.navigationItem.title = title;
   
    SDNavigationController *nc = [[SDNavigationController alloc] initWithRootViewController:vc];
    
    if (image && selectImage) {
        nc.tabBarItem.image = [[UIImage imageNamed:image]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        //注意: iOS8需要加
        nc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    }

//    [self.tabBarItem setImageInsets:UIEdgeInsetsMake(10, 0, 0, 0)];
    //添加到tabBar中
    NSMutableArray *marr = [[NSMutableArray alloc] initWithArray:self.viewControllers];
    [marr addObject:nc];
    
    self.viewControllers = marr;
    
#pragma mark -- 中间按钮不需要动画
    if (marr.count == 2) {
        return vc;
    }
    
    TabItemImgView *tabImg = [[TabItemImgView alloc] initWithImage:nc.tabBarItem.selectedImage];
    if (marr.count == 1) {
        tabImg.frame = CGRectMake(SD_height(50), 11, SD_height(26), SD_height(26));
    }else
    {
        tabImg.frame = CGRectMake(SDScreenWidth - SD_height(50) - SD_height(26), 11, SD_height(26), SD_height(26));
    }
    tabImg.startAnimationOption = ^{
        nc.tabBarItem.image = nil;
    };
    
    tabImg.stopAnimationOption = ^{
        if (image && selectImage) {
            nc.tabBarItem.image = [[UIImage imageNamed:image]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            nc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
        }
    };
    tabImg.alpha = 0;
    [self.tabBar addSubview:tabImg];
    [nc.tabBarItem setAniImg:tabImg];
    
    nc.tabBarItem.tag = marr.count;
    
    return vc;

}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if (item.tag == 2) {
        return;
    }else
    {
        TabItemImgView *tabImg = (TabItemImgView *)[item aniImg];
        [tabImg playBounceAnimation];
    }
    
}
@end
