//
// RoomViewController.h
//  UITableTest
//
//  Created by Drew Harry on 6/18/10.
//  Copyright MIT Media Lab 2010. All rights reserved.
//
#import "UITableTestMasterViewController.h"
#import <UIKit/UIKit.h>
@class UITableTestMasterViewController;
@interface RoomViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray *roomList;
	NSMutableArray *meetingList;
	NSMutableArray *countedList;
	UITableTestMasterViewController *controller;
}

- (id)initWithFrame:(CGRect)frame withController:(UITableTestMasterViewController *)control;
@property (nonatomic, retain) NSMutableArray *roomList;
@property (nonatomic, retain) NSMutableArray *meetingList;
@property (nonatomic, retain) NSMutableArray *countedList;

@end

