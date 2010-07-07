//
//  UITableTestMasterViewController.h
//  UITableTest
//
//  Created by Paula Jacobs on 6/29/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContinueButton.h"
#import "LogoView.h"
#import "LocationViewController.h"

@class UITableTestMasterViewController;

@class LogoView;

@interface UITableTestMasterViewController : UIViewController {
	int pageChecker;
	
	CGFloat beginPointSuper;
	CGFloat beginPoint;
	CGFloat endPoint;
	CGFloat currentPoint;
	UIScrollView *myScrollView;
}

-(void)checkArrowsWithPage:(CGFloat)pageCheck;
-(void)moveWithBegin:(CGFloat)begin withEnd:(CGFloat)end;


@end
