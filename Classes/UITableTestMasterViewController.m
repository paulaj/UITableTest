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
#import "LogoView.h"
#import "LocationViewController.h"
#import "RoomViewController.h"

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
	
	//masterView
	//CCGRect appFrame = [[UIScreen mainScreen] applicationFrame];
	//CGFloat x = appFrame.size.height;
	//CGFloat y = appFrame.size.height;
	
	self.view= [[UIView alloc] initWithFrame:CGRectMake(0,0, 1600.0, 700.0) ];
	self.view.center= CGPointMake(768/2.0+600, 1024/2.0);
	//Arrows
	CGFloat arrowSize= self.view.frame.size.width/50.0;
	CGFloat arrowSpace=self.view.frame.size.width/9.0;
	
	Arrow *arrowPicRight=[[[Arrow alloc] initWithFrame: CGRectMake(self.view.frame.size.width/2.0-(2*arrowSpace), self.view.frame.size.height/2.0 -(arrowSize/2.0), arrowSize, arrowSize) withDirectionOfChange:@"Right" withController:self] retain];
	Arrow *arrowLocLeft=[[[Arrow alloc] initWithFrame: CGRectMake(self.view.frame.size.width/2.0-(arrowSpace)-(arrowSize) , self.view.frame.size.height/2.0-(arrowSize/2.0), arrowSize, arrowSize) withDirectionOfChange:@"Left" withController:self] retain];
	Arrow *arrowLocRight=[[[Arrow alloc] initWithFrame: CGRectMake(self.view.frame.size.width/2.0+(arrowSpace), self.view.frame.size.height/2.0 -(arrowSize/2.0), arrowSize, arrowSize) withDirectionOfChange:@"Right" withController:self] retain];
	Arrow *arrowRoomLeft=[[[Arrow alloc] initWithFrame: CGRectMake(self.view.frame.size.width/2.0+(2*arrowSpace) , self.view.frame.size.height/2.0-(arrowSize/2.0), arrowSize, arrowSize) withDirectionOfChange:@"Left" withController:self] retain];
	
	//Larger Elements
	CGFloat picSize= self.view.frame.size.width/4.0;
	LogoView *picView= [[[LogoView alloc] initWithImage:[UIImage imageNamed:@"tin_can_phone.jpg"] withFrame: CGRectMake(0 , self.view.frame.size.height/2.0 -(picSize/2.0), picSize, picSize)] retain];
	CGFloat locSizeX=300.0;
	CGFloat locSizeY=400.0;
	
	LocationViewController *locViewController = [[[LocationViewController alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2.0-(locSizeX/2.0) , self.view.frame.size.height/2.0-(locSizeY/2.0), locSizeX, locSizeY)] retain];
	RoomViewController *roomViewController = [[[RoomViewController alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2.0+(2*arrowSpace)+(arrowSize)+(arrowSpace-(locSizeX/2.0)) , self.view.frame.size.height/2.0-(locSizeY/2.0), locSizeX, locSizeY)] retain];
		
    CGRect bounds = CGRectMake(self.view.frame.size.width/2.0-(locSizeX/2.0) -4, self.view.frame.size.height/2.0-(locSizeY/2.0)-4, locSizeX+8,locSizeY+8);
	UIView *borderView = [[UIView alloc] initWithFrame:bounds];
	[borderView setBackgroundColor:[UIColor redColor]];
	[self.view addSubview:borderView];
	[self.view addSubview:picView];
	[borderView release];
	
	CGRect bounds2 = CGRectMake(self.view.frame.size.width/2.0+(2*arrowSpace)+(arrowSize)+(arrowSpace-(locSizeX/2.0))-4, self.view.frame.size.height/2.0-(locSizeY/2.0)-4, locSizeX+8,locSizeY+8);
	UIView *border2View = [[UIView alloc] initWithFrame:bounds2];
	[border2View setBackgroundColor:[UIColor redColor]];
	[self.view addSubview:border2View];
	[border2View release];
	
	[self.view setBackgroundColor:[UIColor blackColor]]; // so it doesn't hurt eyes
	
	[self.view addSubview:arrowLocLeft];
	[self.view addSubview:arrowLocRight];
	[self.view addSubview:arrowRoomLeft];
	[self.view addSubview:arrowPicRight];
	[self.view addSubview:picView];
	[self.view addSubview:locViewController.view];
	[self.view addSubview:roomViewController.view];
	
	
	
	
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
