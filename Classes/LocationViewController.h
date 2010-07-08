//
//  LocationViewController.h
//  UITableTest
//
//  Created by Drew Harry on 6/18/10.
//  Copyright MIT Media Lab 2010. All rights reserved.
//
#import "UITableTestMasterViewController.h"
#import <UIKit/UIKit.h>
@class UITableTestMasterViewController;
@interface LocationViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray *locList;
	UITableTestMasterViewController *controller;
}

- (id)initWithFrame:(CGRect)frame withController:(UITableTestMasterViewController *)control;
@property (nonatomic, retain) NSMutableArray *locList;

@end

