//
//  UITableTestMasterViewController.h
//  UITableTest
//
//  Created by Paula Jacobs on 6/29/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
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
	UIButton *roundedButtonType;
	NSString *chosenLocation;
	NSString *chosenRoom;
}

-(void)moveWithBegin:(CGFloat)begin withEnd:(CGFloat)end;
-(void)infoButtonPressed:(id)sender;
-(void)ChooseLocationWithLocation:(NSString *)loc;
-(void)ChooseRoomWithRoom:(NSString *)room;
@end
