//
//  UITableTestMasterViewController.h
//  UITableTest
//
//  Created by Paula Jacobs on 6/29/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Arrow.h"
#import "LogoView.h"
#import "LocationViewController.h"

@class UITableTestMasterViewController;
@class Arrow;
@class LogoView;

@interface UITableTestMasterViewController : UIViewController {
	CGFloat pageChecker;
	Arrow *arrowPicRight;
	Arrow *arrowLocLeft;
	Arrow *arrowLocRight;
	Arrow *arrowRoomLeft;

}

-(void)checkArrowsWithPage:(CGFloat)pageCheck;
-(void)moveLeft;
-(void)moveRight;
@end
