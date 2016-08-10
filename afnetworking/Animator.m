//
//  Animator.m
//  afnetworking
//
//  Created by 王玉翠 on 16/8/8.
//  Copyright © 2016年 王玉翠. All rights reserved.
//

#import "Animator.h"


@interface Animator()<UIViewControllerAnimatedTransitioning>

@end

@implementation Animator
//定义动画的时常
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    
    return 0.25;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
//描述动画的整体执行效果
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewKey];
    
    UIViewController *fromeViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewKey];
    toViewController.view.alpha = 0;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromeViewController.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
    } completion:^(BOOL finished) {
       
        fromeViewController.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:[transitionContext transitionWasCancelled]];
        
        
    }];
    
    
}



@end
