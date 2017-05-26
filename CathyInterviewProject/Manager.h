//
//  Manager.h
//  CathyInterviewProject
//
//  Created by 陳冠華 on 2017/5/24.
//  Copyright © 2017年 my app. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParkDetail.h"


@class Manager;

@protocol ManagerDelegate <NSObject>

- (void)manager:(Manager *)manager didGet:(NSArray<ParkDetail *> *)detail;
- (void)manager:(Manager *)manager didFailWith:(NSError *)error;

@end



@interface Manager : NSObject <NSURLSessionDelegate, NSURLSessionDelegate, NSURLSessionTaskDelegate>


@property (weak, nonatomic) id <ManagerDelegate> delegate;
@property (strong, nonatomic) NSMutableArray<ParkDetail *> *detailArray;


+ (instancetype)sharedInstance;

- (void) getParkDetailDataWithOffset: (NSUInteger)offset ;

@end
