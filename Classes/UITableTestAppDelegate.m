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
    
    UITableTestViewController *tableViewController = [UITableTestViewController alloc];
	UIView *newView= [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1400, 1400) ];

   

    // Override point for customization after app launch
	//border
	CGRect bounds = CGRectMake(198, 198, 324,464);
	UIView *borderView = [[UIView alloc] initWithFrame:bounds];
	[borderView setBackgroundColor:[UIColor redColor]];
	[newView addSubview:borderView];
	[borderView release];
	
    [newView addSubview:tableViewController.view];

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
