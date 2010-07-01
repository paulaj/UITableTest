//
//  UITableTestAppDelegate.m
//  UITableTest
//
//  Created by Drew Harry on 6/18/10.
//  Copyright MIT Media Lab 2010. All rights reserved.
//

#import "UITableTestAppDelegate.h"
#import "UITableTestMasterViewController.h"




@implementation UITableTestAppDelegate

@synthesize window;
@synthesize viewController;



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    UITableTestMasterViewController *tableViewController = [UITableTestMasterViewController alloc];
	
	CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI/2);
	//transform = CGAffineTransformTranslate(transform, 600, 0);
	
	[window setTransform:transform];
	
	
	[window setBackgroundColor:[UIColor blackColor]];
   	
    [window addSubview:tableViewController.view];
	

    [window makeKeyAndVisible];
	
	
	
		
	return YES;
}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return NO;
}
- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
