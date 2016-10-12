//
//  TabItemImgView.m
//  LiveTele
//
//  Created by golomee on 16/9/22.
//  Copyright © 2016年 Golomee. All rights reserved.
//

#import "TabItemImgView.h"

@implementation TabItemImgView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return self;
}
-(void)playBounceAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    
    animation.values = @[@(1), @(1.3), @(1.0), @(0.8), @(0.5), @(1.0),@(0.8), @(0.5),@(1.0)];
    animation.duration = 0.5;
    animation.calculationMode = kCAAnimationCubic;
    animation.delegate = self;
    [self.layer addAnimation:animation forKey:@"playBounceAnimation"];
    
}
-(void)animationDidStart:(CAAnimation *)anim
{
    self.alpha = 1;
    if(self.startAnimationOption){
        self.startAnimationOption();
    }
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    self.alpha = 0;
    if (self.stopAnimationOption) {
        self.stopAnimationOption();
    }
}
@end
