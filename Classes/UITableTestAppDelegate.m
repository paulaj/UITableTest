//
//  UITableTestAppDelegate.m
//  UITableTest
//
//  Created by Drew Harry on 6/18/10.
//  Copyright MIT Media Lab 2010. All rights reserved.
//

#import "UITableTestAppDelegate.h"
#import "UITableTestViewController.h"
//#import "Borders.h"
@implementation UITableTestAppDelegate

@synthesize window;
@synthesize viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    UITableTestViewController *tableViewController = [UITableTestViewController alloc]; //initWithFrame:CGRectMake(0, 0, 100, 500)];
	UIView *newView= [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1400, 1400) ];
//    Borders *border1=[[[Borders alloc] initWithFrame: CGRectMake(500, 60, 50, 50) ] retain];
   

    // Override point for customization after app launch    
    [newView addSubview:tableViewController.view];
//	[newView addSubview:border1];
	[newView setBackgroundColor:[UIColor whiteColor]];
	[window addSubview:newView];
    [window makeKeyAndVisible];
	
	

	return YES;
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
