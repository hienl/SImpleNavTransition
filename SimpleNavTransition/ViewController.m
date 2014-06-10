//
//  ViewController.m
//  SimpleNavTransition
//
//  Created by Goro Otsubo @ Next Inc. on 2013/10/22.
//  Copyright (c) 2013年 Goro Otsubo. All rights reserved.
//

#import "ViewController.h"
#import "TransitionDelegate.h"
#import "OtherViewController.h"

@interface ViewController ()

@property (nonatomic) TransitionDelegate *transitioningDelegate;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Transitionを起動するためのボタンの作成
    //Make "Simple Push"button
    UIButton* simpleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [simpleButton setTitle:@"Simple Transition" forState:UIControlStateNormal];
    [simpleButton addTarget:self action:@selector(simpleButtonPushed:) forControlEvents:UIControlEventTouchUpInside];
    
    simpleButton.backgroundColor = [UIColor orangeColor];
    simpleButton.frame = CGRectMake(30,70,150,30);
    
    [self.view addSubview:simpleButton];
    
    //Make "Push me" button
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"Magnify Transition" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(magnifyButtonPushed:) forControlEvents:UIControlEventTouchUpInside];

    button.backgroundColor = [UIColor redColor];
    button.frame = CGRectMake(30,150,150,30);
    
    [self.view addSubview:button];
    
    //set transition delegate
    self.transitioningDelegate =[TransitionDelegate new];
    
    //set background color
    self.view.backgroundColor = [UIColor cyanColor];
    
}

//"Simple Transition"ボタンを押した際に呼ばれるメソッド
//method called when "Simple Transition" button is pushed.
-(void) simpleButtonPushed:(id)sender
{
    //PushされるViewControllerを作る　//make view controller to be pushed
    OtherViewController* otherViewController = [OtherViewController new];
    
    //delegateをクリアする
    //clear delegate
    self.navigationController.delegate = nil;

    //push it.
    [self.navigationController pushViewController:otherViewController animated:YES];
    
}

//"Magnify Transition"ボタンを押した際に呼ばれるメソッド
//method called when "Magnify Transition" button is pushed.
-(void) magnifyButtonPushed:(id)sender
{
    //PushされるViewControllerを作る　//make view controller to be pushed
    OtherViewController* otherViewController = [OtherViewController new];
    
    //set transition delegate. need to set each time
    self.navigationController.delegate = _transitioningDelegate;
    
    //push it.
    [self.navigationController pushViewController:otherViewController animated:YES];
    
}

@end
