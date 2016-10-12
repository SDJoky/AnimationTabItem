//
//  UITabBarController+SDExtension.h
//  LiveTele
//
//  Created by golomee on 16/5/19.
//  Copyright © 2016年 Golomee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarController (SDExtension)
//为标签栏控制器添加一个界面
-(id)addViewControlerWithClass:(Class )cls
                         title:(NSString *)title
                         image:(NSString *)image
                   selectImage:(NSString *)selectImage ;
@end
