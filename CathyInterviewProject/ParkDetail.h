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

@property int idLabel;

@property NSString *parkName;

@property NSString *name;

@property UIImage *image;

@property NSString *introduction;

- (id)initName: (NSString *)name parkName: (NSString *)parkName idLabel: (int)idLabel introduction: (NSString *)introduction image: (UIImage *)image;

@end
