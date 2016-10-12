//
//  UITabBarItem+SDTabbarItem.m
//  LiveTele
//
//  Created by golomee on 16/9/22.
//  Copyright © 2016年 Golomee. All rights reserved.
//

#import "UITabBarItem+SDTabbarItem.h"

static const void *aniImgKey = &aniImgKey;
@implementation UITabBarItem (SDTabbarItem)
-(UIImageView *)aniImg
{
    return objc_getAssociatedObject(self, aniImgKey);
}

-(void)setAniImg:(UIImageView *)aniImg
{
    objc_setAssociatedObject(self, aniImgKey, aniImg, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}
@end
