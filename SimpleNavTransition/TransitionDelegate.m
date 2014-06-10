//
//  TransitionDelegate.m
//  SimpleNavTransition
//
//  Created by Goro Otsubo @ Next Inc. on 2013/10/22.
//  Copyright (c) 2013年 Goro Otsubo. All rights reserved.
//

#import "TransitionDelegate.h"
#import "MagAnimTransition.h"

@interface TransitionDelegate ()

@end

@implementation TransitionDelegate


- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromViewController
                                                 toViewController:(UIViewController *)toViewController
{
    MagAnimTransition *transition = [MagAnimTransition new];
    if(operation == UINavigationControllerOperationPop){
        //Pushでなくて、Popの場合はTransitionはreverse
        //if "Pop" operation, that means transition is reverse
        transition.reverse = YES;
    }
    return transition;
    
}

@end
