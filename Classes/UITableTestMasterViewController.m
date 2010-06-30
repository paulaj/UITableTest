    //
//  UITableTestMasterViewController.m
//  UITableTest
//
//  Created by Paula Jacobs on 6/29/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import "UITableTestMasterViewController.h"
#import "UITableTestAppDelegate.h"
#import "Arrow.h"


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
	//CCGRect appFrame = [[UIScreen mainScreen] applicationFrame];
	//CGFloat x = appFrame.size.height;
	//CGFloat y = appFrame.size.height;
	
	self.view= [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1400, 700) ];
	self.view.center= CGPointMake(768/2.0, 1024/2.0);
	//Arrows
	CGFloat arrowSize= self.view.frame.size.width/40.0;
	CGFloat arrowSpace=self.view.frame.size.width/8;
	
	Arrow *arrowPicRight=[[[Arrow alloc] initWithFrame: CGRectMake(self.view.frame.size.width/2-(1.5*arrowSpace), self.view.frame.size.height/2.0 -(arrowSize/2.0), arrowSize, arrowSize) withDirectionOfChange:@"Right" withController:self] retain];
	Arrow *arrowLocLeft=[[[Arrow alloc] initWithFrame: CGRectMake(self.view.frame.size.width/2-(arrowSpace) , self.view.frame.size.height/2.0-(arrowSize/2.0), arrowSize, arrowSize) withDirectionOfChange:@"Left" withController:self] retain];
	Arrow *arrowLocRight=[[[Arrow alloc] initWithFrame: CGRectMake(self.view.frame.size.width/2+(arrowSpace), self.view.frame.size.height/2.0 -(arrowSize/2.0), arrowSize, arrowSize) withDirectionOfChange:@"Right" withController:self] retain];
	Arrow *arrowRoomLeft=[[[Arrow alloc] initWithFrame: CGRectMake(self.view.frame.size.width/2+(1.5*arrowSpace) , self.view.frame.size.height/2.0-(arrowSize/2.0), arrowSize, arrowSize) withDirectionOfChange:@"Left" withController:self] retain];
			
		
    
	[self.view setBackgroundColor:[UIColor grayColor]]; // so it doesn't hurt eyes
	
	[self.view addSubview:arrowLocLeft];
	[self.view addSubview:arrowLocRight];
	[self.view addSubview:arrowRoomLeft];
	[self.view addSubview:arrowPicRight];
	
	
	//landscape
	//CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI/2);
//	transform=CGAffineTransformScale(transform, .5, .5);
//	self.view.transform = transform;
//		
	
}

-(void)moveLeft{
	[UIView beginAnimations:@"move_to_Left" context:NULL];
	
	[UIView setAnimationDuration:1.0f];
	//self.center = CGPointMake(384, 512)
	
	//    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI/2);
	self.view.center=CGPointMake(self.view.center.x+600,self.view.center.y);
	
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
	self.view.center=CGPointMake(self.view.center.x-600,self.view.center.y);
	
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
    return NO;
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
