//
//  ParkTableViewCell.m
//  CathyInterviewProject
//
//  Created by 陳冠華 on 2017/5/24.
//  Copyright © 2017年 my app. All rights reserved.
//

#import "ParkTableViewCell.h"

@implementation ParkTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

    [self.image setContentMode:UIViewContentModeScaleAspectFit];


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
