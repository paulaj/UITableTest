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
	pageChecker=0;
	//masterView
	//CCGRect appFrame = [[UIScreen mainScreen] applicationFrame];
	//CGFloat x = appFrame.size.height;
	//CGFloat y = appFrame.size.height;
	
	self.view= [[UIView alloc] initWithFrame:CGRectMake(0,0, 1800.0, 700.0) ];
	self.view.center= CGPointMake(768/2.0+600, 1024/2.0);
	//Arrows
	CGFloat arrowSize= self.view.frame.size.width/30.0;
	CGFloat arrowSpace=self.view.frame.size.width/8.50;
	
	arrowPicRight=[[[Arrow alloc] initWithFrame: CGRectMake(self.view.frame.size.width/2.0-(1.5*arrowSpace)-(arrowSize), self.view.frame.size.height/2.0 -(arrowSize/2.0), arrowSize, arrowSize) withDirectionOfChange:@"Right" withController:self] retain];
	arrowLocLeft=[[[Arrow alloc] initWithFrame: CGRectMake(self.view.frame.size.width/2.0-(arrowSpace)-(arrowSize) , self.view.frame.size.height/2.0-(arrowSize/2.0), arrowSize, arrowSize) withDirectionOfChange:@"Left" withController:self] retain];
	arrowLocRight=[[[Arrow alloc] initWithFrame: CGRectMake(self.view.frame.size.width/2.0+(arrowSpace), self.view.frame.size.height/2.0 -(arrowSize/2.0), arrowSize, arrowSize) withDirectionOfChange:@"Right" withController:self] retain];
	arrowRoomLeft=[[[Arrow alloc] initWithFrame: CGRectMake(self.view.frame.size.width/2.0+(1.5*arrowSpace) , self.view.frame.size.height/2.0-(arrowSize/2.0), arrowSize, arrowSize) withDirectionOfChange:@"Left" withController:self] retain];
	
	//Larger Elements
	CGFloat picSize= self.view.frame.size.width/4.0;
	LogoView *picView= [[[LogoView alloc] initWithImage:[UIImage imageNamed:@"tin_can_phone.jpg"] withFrame: CGRectMake(self.view.frame.size.width/2.0-(1.5*arrowSpace)-(1.5*arrowSize)-(picSize) , self.view.frame.size.height/2.0 -(picSize/2.0), picSize, picSize)] retain];
	CGFloat locSizeX=400.0;
	CGFloat locSizeY=500.0;
	
	LocationViewController *locViewController = [[[LocationViewController alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2.0-(locSizeX/2.0) , self.view.frame.size.height/2.0-(locSizeY/2.0), locSizeX, locSizeY)] retain];
	RoomViewController *roomViewController = [[[RoomViewController alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2.0+(1.5*arrowSpace)+(arrowSize)+(arrowSpace-(locSizeX/2.0)) , self.view.frame.size.height/2.0-(locSizeY/2.0), locSizeX, locSizeY)] retain];
		
    CGRect bounds = CGRectMake(self.view.frame.size.width/2.0-(locSizeX/2.0) -2, self.view.frame.size.height/2.0-(locSizeY/2.0)-2, locSizeX+4,locSizeY+4);
	UIView *borderView = [[UIView alloc] initWithFrame:bounds];
	[borderView setBackgroundColor:[UIColor grayColor]];
	[self.view addSubview:borderView];
	[self.view addSubview:picView];
	[borderView release];
	
	CGRect bounds2 = CGRectMake(self.view.frame.size.width/2.0+(1.5*arrowSpace)+(arrowSize)+(arrowSpace-(locSizeX/2.0))-2, self.view.frame.size.height/2.0-(locSizeY/2.0)-2, locSizeX+4,locSizeY+4);
	UIView *border2View = [[UIView alloc] initWithFrame:bounds2];
	[border2View setBackgroundColor:[UIColor grayColor]];
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
	
	[self checkArrowsWithPage:pageChecker];
	[self.view setNeedsDisplay];
	
	
	//landscape
	//CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI/2);
//	transform=CGAffineTransformScale(transform, .5, .5);
//	self.view.transform = transform;
//		
	
}
-(void)checkArrowsWithPage:(CGFloat)pageCheck{
	if (pageCheck==0) {
		arrowPicRight.disable=false;
		arrowLocLeft.disable=true;
		arrowRoomLeft.disable=true;
		arrowLocRight.disable=true;
		[arrowPicRight setNeedsDisplay];
		[arrowLocLeft setNeedsDisplay];
		[arrowRoomLeft setNeedsDisplay];
		[arrowLocRight setNeedsDisplay];
	}
	else if (pageCheck==1){
		arrowLocLeft.disable=false;
		arrowPicRight.disable=true;
		arrowRoomLeft.disable=true;
		arrowLocRight.disable=false;
		
		[arrowPicRight setNeedsDisplay];
		[arrowLocLeft setNeedsDisplay];
		[arrowRoomLeft setNeedsDisplay];
		[arrowLocRight setNeedsDisplay];
	}
	else if (pageCheck==2){
		arrowRoomLeft.disable=false;
		arrowPicRight.disable=true;
		arrowLocLeft.disable=true;
		arrowLocRight.disable=true;
		[arrowPicRight setNeedsDisplay];
		[arrowLocLeft setNeedsDisplay];
		[arrowRoomLeft setNeedsDisplay];
		[arrowLocRight setNeedsDisplay];
		 
	}
}
-(void)moveLeft{
	[UIView beginAnimations:@"move_to_Left" context:NULL];
	
	[UIView setAnimationDuration:1.0f];
	//self.center = CGPointMake(384, 512)
	
	//    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI/2);
	self.view.center=CGPointMake(self.view.center.x+600,self.view.center.y);
	pageChecker=pageChecker-1;
	[self checkArrowsWithPage:pageChecker];
	[self.view setNeedsDisplay];	
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
	pageChecker=pageChecker+1;
	[self checkArrowsWithPage:pageChecker];
	[self.view setNeedsDisplay];
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
