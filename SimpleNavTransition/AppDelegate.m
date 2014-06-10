//
//  AppDelegate.m
//  SimpleNavTransition
//
//  Created by  Goro Otsub@Next inc. on 2013/10/22.
//  Copyright (c) 2013年  Goro Otsubo @ Next Inc. All rights reserved.
//
#import "TransitionDelegate.h"
#import "AppDelegate.h"
#import "ViewController.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    //最初に表示されるviewControllerを作る
    //make view controller which will be displayed first
    ViewController* baseViewCtrl = [[ViewController alloc]init];
    CGRect bounds = [[UIScreen mainScreen] bounds];

    baseViewCtrl.view.frame = CGRectMake(0,0,bounds.size.width, bounds.size.height);    
    
    //make navigation controller and make it as root
    //UINavigationControllerを作り、rootViewControlelrにする。
    UINavigationController* navCtrl=[[UINavigationController alloc] initWithRootViewController:baseViewCtrl ];
    self.window.rootViewController   = navCtrl;
    
    
    [self.window makeKeyAndVisible];
    return YES;
}
							


@end
