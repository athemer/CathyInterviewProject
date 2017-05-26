//
//  ParkDetail.m
//  CathyInterviewProject
//
//  Created by 陳冠華 on 2017/5/24.
//  Copyright © 2017年 my app. All rights reserved.
//


#import "ParkDetail.h"

@implementation ParkDetail

- (id)initName: (NSString *)name parkName: (NSString *)parkName idLabel: (NSString *)idLabel introduction: (NSString *)introduction image: (NSURL *)image; {

    self = [super init];
    if (self) {

        _name = name;
        _parkName = parkName;
        _idLabel = idLabel;
        _introduction = introduction;
        _image = image;

    }

    return self;
}

@end
