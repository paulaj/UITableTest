//
//  UITableTestAppDelegate.h
//  UITableTest
//
//  Created by Drew Harry on 6/18/10.
//  Copyright MIT Media Lab 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Arrow.h"

@class UITableTestViewController;
@class Arrow;

@interface UITableTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UITableTestViewController *viewController;
	UIView *newView;
	
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITableTestViewController *viewController;
@property (nonatomic, retain) IBOutlet UIView *newView;

@end

