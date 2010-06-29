//
//  UITableTestAppDelegate.m
//  UITableTest
//
//  Created by Drew Harry on 6/18/10.
//  Copyright MIT Media Lab 2010. All rights reserved.
//

#import "UITableTestAppDelegate.h"
#import "UITableTestViewController.h"
#import "UITableTestViewController2.h"
#import "Arrow.h"
#import "LogoView.h"

@implementation UITableTestAppDelegate

@synthesize window;
@synthesize viewController;
@synthesize newView;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    UITableTestViewController *tableViewController = [UITableTestViewController alloc];
	UITableTestViewController2 *tableViewController2 = [UITableTestViewController2 alloc];
	newView= [[UIView alloc] initWithFrame:CGRectMake(0, 0, 768, 1024) ];
	Arrow *arrowLeft=[[[Arrow alloc] initWithFrame: CGRectMake(148, 470, 50, 50) withDirectionOfChange:@"Left"] retain];
	Arrow *arrowLeft4OtherTable=[[[Arrow alloc] initWithFrame: CGRectMake(645, 470, 50, 50) withDirectionOfChange:@"Left"] retain];
	
	Arrow *arrowRight=[[[Arrow alloc] initWithFrame: CGRectMake(522.5, 470, 50, 50) withDirectionOfChange:@"Right"] retain];
	Arrow *arrowRight4Pic=[[[Arrow alloc] initWithFrame: CGRectMake(30, 470, 50, 50) withDirectionOfChange:@"Right"] retain];
	
	LogoView *picView= [[[LogoView alloc] initWithImage:[UIImage imageNamed:@"With_Elements_edit.jpg"] withFrame: CGRectMake(-470, 280, 500, 500)] retain];


    // Override point for customization after app launch
	//border
	CGRect bounds = CGRectMake(198, 298, 324,464);
	UIView *borderView = [[UIView alloc] initWithFrame:bounds];
	[borderView setBackgroundColor:[UIColor redColor]];
	[newView addSubview:borderView];
	[newView addSubview:picView];
	[borderView release];
	
	CGRect bounds2 = CGRectMake(698, 298, 324,464);
	UIView *border2View = [[UIView alloc] initWithFrame:bounds2];
	[border2View setBackgroundColor:[UIColor redColor]];
	[newView addSubview:border2View];
	[border2View release];
	
    [newView addSubview:tableViewController.view];
	[newView addSubview:tableViewController2.view];
	[newView setBackgroundColor:[UIColor whiteColor]];
	
	[newView addSubview:arrowLeft];
	[newView addSubview:arrowRight];
	[newView addSubview:arrowRight4Pic];
	[newView addSubview:arrowLeft4OtherTable];
	[window addSubview:newView];
    [window makeKeyAndVisible];
	
	//landscape
	CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI/2);
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
