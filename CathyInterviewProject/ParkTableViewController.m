//
//  ParkTableViewController.m
//  CathyInterviewProject
//
//  Created by 陳冠華 on 2017/5/25.
//  Copyright © 2017年 my app. All rights reserved.
//

#import "ParkTableViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>


@interface ParkTableViewController ()

@end

@implementation ParkTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Manager.sharedInstance.delegate = self;

    [Manager.sharedInstance getParkDetailDataWithOffset: 0];


    [self.tableView registerNib:[UINib nibWithNibName: @"ParkTableViewCell"
                                               bundle: nil]
         forCellReuseIdentifier: @"ParkTableViewCell"];

    self.tableView.allowsSelection = NO;

    self.tableView.rowHeight = UITableViewAutomaticDimension;

    self.tableView.estimatedRowHeight = 300;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.parkDetail.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ParkTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier: @"ParkTableViewCell" forIndexPath:indexPath];


    cell.name.text = self.parkDetail[indexPath.row].name;
    cell.introduction.text = self.parkDetail[indexPath.row].introduction;
    cell.parkName.text = self.parkDetail[indexPath.row].parkName;
    cell.idLabel.text = self.parkDetail[indexPath.row].idLabel;


    dispatch_async(dispatch_get_main_queue(), ^{

        [cell.image sd_setImageWithURL: self.parkDetail[indexPath.row].image placeholderImage: [UIImage imageNamed: @"loading"]];

    });


    return cell;
}

- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {

    NSInteger lastElement = self.parkDetail.count - 1;



    if (indexPath.row == lastElement && self.parkDetail.count != 0) {

        [Manager.sharedInstance getParkDetailDataWithOffset: self.parkDetail.count];

        NSLog(@" ===== Count %lu ===== ", self.parkDetail.count);

    }


    if (indexPath.row == 294) {

        UIAlertController * alert=  [UIAlertController
                                      alertControllerWithTitle:@"最後一筆"
                                      message:@"已是最後一筆資料"
                                      preferredStyle: UIAlertControllerStyleAlert];


        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"了解"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {

                                [alert dismissViewControllerAnimated: YES completion:nil];

                             }];
        [alert addAction:ok];

        [self presentViewController:alert animated:YES completion:nil];

    }

}

#pragma mark - ManagerDelegate

- (void)manager:(Manager *)manager didGet:(NSArray<ParkDetail *> *)detail {

    self.parkDetail = detail;

    [self.tableView reloadData];


};


- (void)manager:(Manager *)manager didFailWith:(NSError *)error {

    NSLog(@"%@", error);

};




@end
