//
//  UITableTestAppDelegate.m
//  UITableTest
//
//  Created by Drew Harry on 6/18/10.
//  Copyright MIT Media Lab 2010. All rights reserved.
//

#import "UITableTestAppDelegate.h"
#import "UITableTestMasterViewController.h"
#import "UITableTestViewController.h"
#import "UITableTestViewController2.h"
#import "Arrow.h"
#import "LogoView.h"

@implementation UITableTestAppDelegate

@synthesize window;
@synthesize viewController;



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    UITableTestMasterViewController *tableViewController = [UITableTestMasterViewController alloc];
	
	
   	
    [window addSubview:tableViewController.view];
	
    [window makeKeyAndVisible];
	
	
	
		
	return YES;
}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}
- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
