//
// RoomViewController.h
//  UITableTest
//
//  Created by Drew Harry on 6/18/10.
//  Copyright MIT Media Lab 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoomViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray *roomList;
	NSMutableArray *meetingList;
	NSMutableArray *countedList;
}


@property (nonatomic, retain) NSMutableArray *roomList;
@property (nonatomic, retain) NSMutableArray *meetingList;
@property (nonatomic, retain) NSMutableArray *countedList;

@end

