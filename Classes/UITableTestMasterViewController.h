//
//  UITableTestMasterViewController.h
//  UITableTest
//
//  Created by Paula Jacobs on 6/29/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Arrow.h"

@class UITableTestViewController;
@class Arrow;

@interface UITableTestMasterViewController : UIViewController {
		UIView *newView;

}

@property (nonatomic, retain) IBOutlet UIView *newView;
-(void)moveLeft;
-(void)moveRight;
@end
