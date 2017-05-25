//
//  ViewController.m
//  CathyInterviewProject
//
//  Created by 陳冠華 on 2017/5/24.
//  Copyright © 2017年 my app. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [Manager.sharedInstance getParkDetailData];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
