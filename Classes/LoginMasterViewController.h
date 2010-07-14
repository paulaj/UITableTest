//
//  LoginMasterViewController.h
//  Login
//
//  Created by Paula Jacobs on 6/29/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LogoView.h"
#import "LocationViewController.h"
#import "RoomViewController.h"

@class LoginMasterViewController;
@class LocationViewController;
@class RoomViewController;
@class LogoView;

@interface LoginMasterViewController : UIViewController {
	// Tracks the area of the view the user sees
	int currentPage;
	
	// These floats track the x coordinates of touches
	CGFloat beginPointSuper;
	CGFloat beginPoint;
	CGFloat endPoint;
	CGFloat currentPoint;
	
	// These track the user selections
	NSString *chosenLocation;
	NSString *chosenRoom;
	
	UIButton *loginButton;
    UILabel *loginInstructions;
    
	LocationViewController *locViewController;
	RoomViewController *roomViewController;
}

-(void)moveWithBegin:(CGFloat)begin withEnd:(CGFloat)end;
-(void)infoButtonPressed:(id)sender;
-(void)chooseLocationWithLocation:(NSString *)loc;
-(void)chooseRoomWithRoom:(NSString *)room withMeeting:(NSString *)meeting withCount:(NSString*)counted;
@end
