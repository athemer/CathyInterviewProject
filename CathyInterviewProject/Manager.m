//
//  Manager.m
//  CathyInterviewProject
//
//  Created by 陳冠華 on 2017/5/24.
//  Copyright © 2017年 my app. All rights reserved.
//

#import "Manager.h"



@interface Manager()


@end



@implementation Manager



+ (instancetype)sharedInstance {

    static id sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Manager alloc] init];
    });

    return sharedInstance;
}



@end
