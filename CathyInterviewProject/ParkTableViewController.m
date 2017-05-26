//
//  ParkTableViewController.m
//  CathyInterviewProject
//
//  Created by 陳冠華 on 2017/5/25.
//  Copyright © 2017年 my app. All rights reserved.
//

#import "ParkTableViewController.h"

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

    //prevent imageView from flickering
    cell.image.image = [UIImage imageNamed:@"loading"];


    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        NSData *data = [NSData dataWithContentsOfURL: self.parkDetail[indexPath.row].image];

        dispatch_async(dispatch_get_main_queue(), ^{

            ParkTableViewCell *updateCell = (id)[tableView cellForRowAtIndexPath:indexPath];
            updateCell.image.image = [UIImage imageWithData: data];
        });

    });

    return cell;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {

    NSInteger lastElement = self.parkDetail.count - 1;



    if (indexPath.row == lastElement && self.parkDetail.count != 0) {

        [Manager.sharedInstance getParkDetailDataWithOffset: self.parkDetail.count];

        NSLog(@" ===== Count %lu ===== ", self.parkDetail.count);

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
