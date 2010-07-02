//
//  LocationViewController.h
//  UITableTest
//
//  Created by Drew Harry on 6/18/10.
//  Copyright MIT Media Lab 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray *locList;
}

- (id)initWithFrame:(CGRect)frame ;
@property (nonatomic, retain) NSMutableArray *locList;

@end

