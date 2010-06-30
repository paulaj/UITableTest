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
}


@property (nonatomic, retain) NSMutableArray *roomList;

@end

