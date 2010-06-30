//
//  UITableTestMasterViewController.h
//  UITableTest
//
//  Created by Paula Jacobs on 6/29/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Arrow.h"

@class UITableTestMasterViewController;
@class Arrow;

@interface UITableTestMasterViewController : UIViewController {

}

@property (nonatomic, retain) IBOutlet UIView *newView;
-(void)moveLeft;
-(void)moveRight;
@end
