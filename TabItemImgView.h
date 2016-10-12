//
//  TabItemImgView.h
//  LiveTele
//
//  Created by golomee on 16/9/22.
//  Copyright © 2016年 Golomee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabItemImgView : UIImageView<CAAnimationDelegate>

-(void)playBounceAnimation;
@property (nonatomic,copy) void (^startAnimationOption)();
@property (nonatomic,copy) void (^stopAnimationOption)();
@end
