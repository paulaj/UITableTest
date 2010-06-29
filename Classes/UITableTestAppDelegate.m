//
//  UITableTestAppDelegate.m
//  UITableTest
//
//  Created by Drew Harry on 6/18/10.
//  Copyright MIT Media Lab 2010. All rights reserved.
//

#import "UITableTestAppDelegate.h"
#import "UITableTestViewController.h"
#import "Arrow.h"
@implementation UITableTestAppDelegate

@synthesize window;
@synthesize viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    UITableTestViewController *tableViewController = [UITableTestViewController alloc];
	UIView *newView= [[UIView alloc] initWithFrame:CGRectMake(0, 0, 768, 1024) ];
	Arrow *arrowLeft=[[[Arrow alloc] initWithFrame: CGRectMake(120, 400, 50, 50) withDirectionOfChange:@"Left"] retain];
	Arrow *arrowRight=[[[Arrow alloc] initWithFrame: CGRectMake(550, 400, 50, 50) withDirectionOfChange:@"Right"] retain];
   

    // Override point for customization after app launch
	//border
	CGRect bounds = CGRectMake(198, 298, 324,464);
	UIView *borderView = [[UIView alloc] initWithFrame:bounds];
	[borderView setBackgroundColor:[UIColor redColor]];
	[newView addSubview:borderView];
	[borderView release];
	
    [newView addSubview:tableViewController.view];

	[newView setBackgroundColor:[UIColor whiteColor]];
	[newView addSubview:arrowLeft];
	[newView addSubview:arrowRight];
	[window addSubview:newView];
    [window makeKeyAndVisible];
		
	CGAffineTransform transform = CGAffineTransformMakeRotation(3.14159/2);
	newView.transform = transform;
	

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
