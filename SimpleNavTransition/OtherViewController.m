//
//  OtherViewController.m
//  SimpleNavTransition
//
//  Created by GoroOtsubo @ Next Inc. on 2013/10/22.
//  Copyright (c) 2013年 Goro Otsubo. All rights reserved.
//

#import "OtherViewController.h"

@interface OtherViewController ()


@end

@implementation OtherViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //区別がつくように背景色を設定
        //set background color so that user can distinguish 
        self.view.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

@end
