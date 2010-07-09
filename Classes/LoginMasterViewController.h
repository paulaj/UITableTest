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
	int currentPage;
	
	CGFloat beginPointSuper;
	CGFloat beginPoint;
	CGFloat endPoint;
	CGFloat currentPoint;
	UIButton *roundedButtonType;
	NSString *chosenLocation;
	NSString *chosenRoom;
	UILabel *loginInstructions;
	UILabel *roomInstructions;
	UILabel *locationInstructions;
	UILabel *locationSlide;
	UILabel *logoSlide;
	UIButton *loginButton;
	LocationViewController *locViewController;
	RoomViewController *roomViewController;
}

-(void)moveWithBegin:(CGFloat)begin withEnd:(CGFloat)end;
-(void)infoButtonPressed:(id)sender;
-(void)ChooseLocationWithLocation:(NSString *)loc;
-(void)ChooseRoomWithRoom:(NSString *)room withMeeting:(NSString *)meeting withCount:(NSString*)counted;
@end
