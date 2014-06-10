//
//  MagAnimTransition.m
//  TransTest
//
//  Created by Goro Otsubo on 2013/10/01.
//  Copyright (c) 2013年 Goro Otsubo. All rights reserved.
//

#import "MagAnimTransition.h"

@interface MagAnimTransition ()

@end

@implementation MagAnimTransition

const NSTimeInterval kTransitionDuration = 2.0;
    //Transitionにかかる時間（わざと長めに設定）
    //time to do transition (intentionally set long value)

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *container = [transitionContext containerView];
    
    
    if(!_reverse){//Pushの場合　//in case of push
        // toViewControllerのviewのサイズを０にする //make size of toViewController.view to zero
        toViewController.view.transform = CGAffineTransformMakeScale(0, 0);
        //その上でcontainerに付加する                //then add as subview of container
        [container addSubview:toViewController.view];
        [UIView animateKeyframesWithDuration:kTransitionDuration delay:0 options:0 animations:^{
            //toViewController.viewのサイズを元に戻す
            //make size of toViewController to original
            toViewController.view.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            //necessary
            [transitionContext completeTransition:finished];
        }];
        
    }
    else{//Popの場合　//in case of pop
        //toViewをfromViewの下に入れる
        //insert fromView underneath the toView
        [container insertSubview:toViewController.view belowSubview:fromViewController.view];
        
        [UIView animateKeyframesWithDuration:kTransitionDuration delay:0 options:0 animations:^{
            //fromViewのサイズを0にする
            //make size of fromViewController to zero.
            
            fromViewController.view.transform = CGAffineTransformMakeScale(0, 0);
        } completion:^(BOOL finished) {
            //necessary
            [transitionContext completeTransition:finished];
        }];
    }
    

}





- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return kTransitionDuration;
}
@end
