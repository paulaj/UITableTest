//
//  UITableTestViewController2.h
//  UITableTest
//
//  Created by Drew Harry on 6/18/10.
//  Copyright MIT Media Lab 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableTestViewController2 : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray *nameList;
}


@property (nonatomic, retain) NSMutableArray *nameList;

@end

