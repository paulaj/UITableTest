    //
//  UITableTestMasterViewController.m
//  UITableTest
//
//  Created by Paula Jacobs on 6/29/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import "UITableTestMasterViewController.h"
#import "UITableTestAppDelegate.h"
#import "UITableTestViewController.h"
#import "UITableTestViewController2.h"
#import "Arrow.h"
#import "LogoView.h"

@implementation UITableTestMasterViewController




 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
//    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
 //   }
 //   return self;
//}

 
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	NSLog(@"Called?");
	//masterView
	self.view= [[UIView alloc] initWithFrame:CGRectMake(0, 0, 768, 1024) ];

	//tables
	UITableTestViewController *tableViewController = [UITableTestViewController alloc];
	UITableTestViewController2 *tableViewController2 = [UITableTestViewController2 alloc];
	
	//Arrows
	Arrow *arrowLeft=[[[Arrow alloc] initWithFrame: CGRectMake(163, 470, 25, 25) withDirectionOfChange:@"Left" withController:self] retain];
	Arrow *arrowLeft4OtherTable=[[[Arrow alloc] initWithFrame: CGRectMake(660, 470, 25, 25) withDirectionOfChange:@"Left" withController:self] retain];
	
	Arrow *arrowRight=[[[Arrow alloc] initWithFrame: CGRectMake(527.5, 470, 25, 25) withDirectionOfChange:@"Right" withController:self] retain];
	Arrow *arrowRight4Pic=[[[Arrow alloc] initWithFrame: CGRectMake(35, 470, 25, 25) withDirectionOfChange:@"Right" withController:self] retain];
	//Future Logo
	LogoView *picView= [[[LogoView alloc] initWithImage:[UIImage imageNamed:@"With_Elements_edit.jpg"] withFrame: CGRectMake(-470, 280, 500, 500)] retain];
	
	CGRect bounds = CGRectMake(198, 298, 324,464);
	UIView *borderView = [[UIView alloc] initWithFrame:bounds];
	[borderView setBackgroundColor:[UIColor redColor]];
	[self.view addSubview:borderView];
	[self.view addSubview:picView];
	[borderView release];
	
	CGRect bounds2 = CGRectMake(698, 298, 324,464);
	UIView *border2View = [[UIView alloc] initWithFrame:bounds2];
	[border2View setBackgroundColor:[UIColor redColor]];
	[self.view addSubview:border2View];
	[border2View release];
	
    [self.view addSubview:tableViewController.view];
	[self.view addSubview:tableViewController2.view];
	[self.view setBackgroundColor:[UIColor blackColor]];
	
	[self.view addSubview:arrowLeft];
	[self.view addSubview:arrowRight];
	[self.view addSubview:arrowRight4Pic];
	[self.view addSubview:arrowLeft4OtherTable];
	
	
	//landscape
	CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI/2);
	self.view.transform = transform;
		
	
}

-(void)moveLeft{
	[UIView beginAnimations:@"move_to_Left" context:NULL];
	
	[UIView setAnimationDuration:1.0f];
	//self.center = CGPointMake(384, 512)
	
	//    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI/2);
	CGAffineTransform transform = self.view.transform;
	
	transform = CGAffineTransformTranslate(transform, 600, 0);
	[self.view setTransform:transform];
	
	// Now set the callback.
	[UIView setAnimationDelegate:self.view];
	//[UIView setAnimationDidStopSelector:@selector(animateToAssignedParticipantDidStop:finished:context:)];
	
	[UIView commitAnimations];
	
}
-(void)moveRight{ 
	[UIView beginAnimations:@"move_to_Right" context:NULL];
	
	[UIView setAnimationDuration:1.0f];
	//self.center = CGPointMake(384, 512)
	
	//    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI/2);
	CGAffineTransform transform = self.view.transform;
	transform = CGAffineTransformTranslate(transform,  -600, 0);
	[self.view setTransform:transform];
	
	// Now set the callback.
	[UIView setAnimationDelegate:self.view];
	//[UIView setAnimationDidStopSelector:@selector(animateToAssignedParticipantDidStop:finished:context:)];
	
	[UIView commitAnimations];
	
}	
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}

 
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [self.view release];
    [super dealloc];
}


@end
