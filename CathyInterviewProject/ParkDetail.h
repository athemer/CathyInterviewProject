//
//  ParkDetail.h
//  CathyInterviewProject
//
//  Created by 陳冠華 on 2017/5/24.
//  Copyright © 2017年 my app. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ParkDetail : NSObject

@property NSString *idLabel;

@property NSString *parkName;

@property NSString *name;

@property NSURL *imageURL;

@property NSString *introduction;

- (id)initName: (NSString *)name parkName: (NSString *)parkName idLabel: (NSString *)idLabel introduction: (NSString *)introduction imageURL: (NSURL *)imageURL;

@end
