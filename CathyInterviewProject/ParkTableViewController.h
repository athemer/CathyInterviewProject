//
//  ParkTableViewController.h
//  CathyInterviewProject
//
//  Created by 陳冠華 on 2017/5/25.
//  Copyright © 2017年 my app. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Manager.h"
#import "ParkDetail.h"
#import "ParkTableViewCell.h"


@interface ParkTableViewController : UITableViewController <ManagerDelegate>

@property (strong, nonatomic) NSArray <ParkDetail *>* parkDetail;

@property (strong, nonatomic) UIActivityIndicatorView *indicatorView;

@end
