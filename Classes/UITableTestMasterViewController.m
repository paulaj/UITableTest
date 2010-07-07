    //
//  UITableTestMasterViewController.m
//  UITableTest
//
//  Created by Paula Jacobs on 6/29/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import "UITableTestMasterViewController.h"
#import "UITableTestAppDelegate.h"

#import "LogoView.h"
#import "LocationViewController.h"
#import "RoomViewController.h"
#import "headerView.h"

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
	
	
	//myScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0, 1800.0, 700.0)];
	//myScrollView.contentSize=CGSizeMake(758,320);
	//[myScrollView addSubview:self.view];
	
	//self.view=myScrollView;
    //[myScrollView release];
	self.view= [[UIView alloc] initWithFrame:CGRectMake(0,0, 1800.0, 700.0) ];
	self.view.center= CGPointMake(768/2.0+600, 1024/2.0);
	
	
	
	
	
	CGFloat arrowSize= self.view.frame.size.width/30.0;
	CGFloat arrowSpace=self.view.frame.size.width/8.50;
	CGFloat picSize= self.view.frame.size.width/4.0;
	CGFloat locSizeX=400.0;
	CGFloat locSizeY=500.0;
	
	
	
	
	LogoView *picView= [[[LogoView alloc] initWithImage:[UIImage imageNamed:@"tin_can_phone.jpg"] 
											  withFrame: CGRectMake(self.view.frame.size.width/2.0-(1.5*arrowSpace)-(1.5*arrowSize)-(picSize) , self.view.frame.size.height/2.0 -(picSize/2.0), picSize, picSize)] retain];
	
	LocationViewController *locViewController = [[[LocationViewController alloc] 
									initWithFrame:CGRectMake(self.view.frame.size.width/2.0-(locSizeX/2.0) , self.view.frame.size.height/2.0-(locSizeY/2.0), locSizeX, locSizeY)] retain];
	RoomViewController *roomViewController = [[[RoomViewController alloc] 
									initWithFrame:CGRectMake(self.view.frame.size.width/2.0+(1.5*arrowSpace)+(arrowSize)+(arrowSpace-(locSizeX/2.0)) , self.view.frame.size.height/2.0-(locSizeY/2.0), locSizeX, locSizeY)] retain];
	HeaderView *headerLocation =[[[HeaderView alloc] 
									initWithFrame:CGRectMake(self.view.frame.size.width/2.0-(locSizeX/2.0) , self.view.frame.size.height/2.0-(locSizeY/2.0)-60, locSizeX, 60) withTitle:@"Locations"] retain];
	HeaderView *headerRoom =[[[HeaderView alloc] 
									initWithFrame:CGRectMake(self.view.frame.size.width/2.0+(1.5*arrowSpace)+(arrowSize)+(arrowSpace-(locSizeX/2.0)) , self.view.frame.size.height/2.0-(locSizeY/2.0)-60, locSizeX, 60) withTitle:@"Rooms"] retain];
	
    
	
	//CGRect bounds = CGRectMake(self.view.frame.size.width/2.0-(locSizeX/2.0) -2, self.view.frame.size.height/2.0-(locSizeY/2.0)-62, locSizeX+4,locSizeY+64);
	UIView *borderView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2.0-(locSizeX/2.0) -2, self.view.frame.size.height/2.0-(locSizeY/2.0)-62, locSizeX+4,locSizeY+64)];
	[borderView setBackgroundColor:[UIColor grayColor]];
	[self.view addSubview:borderView];
	[borderView release];
	
	
	//CGRect bounds2 = CGRectMake(self.view.frame.size.width/2.0+(1.5*arrowSpace)+(arrowSize)+(arrowSpace-(locSizeX/2.0))-2, self.view.frame.size.height/2.0-(locSizeY/2.0)-62, locSizeX+4,locSizeY+64);
	UIView *border2View = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2.0+(1.5*arrowSpace)+(arrowSize)+(arrowSpace-(locSizeX/2.0))-2, self.view.frame.size.height/2.0-(locSizeY/2.0)-62, locSizeX+4,locSizeY+64)];
	[border2View setBackgroundColor:[UIColor grayColor]];
	[self.view addSubview:border2View];
	[border2View release];
	
	
	
	
	
	//NSString *instructions =@"Swipe To Continue";
//    [[UIColor whiteColor] set];
//    [instructions drawInRect:CGRectMake(self.view.frame.size.width/2.0-(1.5*arrowSpace)-(1.5*arrowSize)-(picSize) , self.view.frame.size.height/2.0-(locSizeY/2.0)+locSizeY, locSizeX+4,locSizeY+64) 
//					withFont:[UIFont systemFontOfSize:50] lineBreakMode:UILineBreakModeWordWrap alignment:UITextAlignmentCenter];
//	[instructions drawInRect:CGRectMake(self.view.frame.size.width/2.0-(locSizeX/2.0) ,self.view.frame.size.height/2.0-(locSizeY/2.0)+locSizeY , locSizeX+4,locSizeY+64) 
//					withFont:[UIFont systemFontOfSize:50] lineBreakMode:UILineBreakModeWordWrap alignment:UITextAlignmentCenter];
	

	
	
	
	[self.view setBackgroundColor:[UIColor blackColor]]; 
	[self.view addSubview:picView];
	[self.view addSubview:locViewController.view];
	[self.view addSubview:roomViewController.view];
	[self.view addSubview:headerLocation];
	[self.view addSubview:headerRoom];

	[self.view setNeedsDisplay];
	NSLog(@"PageChecker:%d",pageChecker);
	
	
	
	
	
	
}
-(void)moveWithBegin:(CGFloat)begin withEnd:(CGFloat)end{
	
	[UIView beginAnimations:@"move_to_Left" context:NULL];
	[UIView setAnimationDuration:.50f];
	
	
	//At zero, you have two options.
	//Either your a large enough stroke to the right and become page one
	//or you remain page zero
	if(pageChecker==0){
		if( (begin-end)>600){
			self.view.center=CGPointMake(768/2.0-600, 1024/2.0);
			pageChecker=2;
		}
		else if( (begin-end)>80){
			self.view.center=CGPointMake(768/2.0, 1024/2.0);
			pageChecker=1;
		}
		else{
			self.view.center=CGPointMake(768/2.0+600, 1024/2.0);
			pageChecker=0;
		}
	}
		
		
	//At one you have three choices
	//You're either left and large enough, right and large enough,
	//Or you just stay at one	
	else if(pageChecker==1){
		if ((begin-end)>80){
			self.view.center=CGPointMake(768/2.0-600, 1024/2.0);
			pageChecker=2;
		} 
		else if ((begin-end)<-80){
			self.view.center=CGPointMake(768/2.0+600, 1024/2.0);
			pageChecker=0;
		}
		else{
			self.view.center=CGPointMake(768/2.0, 1024/2.0);
			pageChecker=1;
		}
	}
	
	
	
	//At two, you have two options.
	//Either your a large enough stroke to the left and become page one
	//or you remain page two.
	
	else if (pageChecker==2){
		if( (begin-end) <-600){
			self.view.center=CGPointMake(768/2.0+600, 1024/2.0);
			pageChecker=0;
		}
		else if( (begin-end) <-80){
			self.view.center=CGPointMake(768/2.0, 1024/2.0);
			pageChecker=1;
		}
		else{
			self.view.center=CGPointMake(768/2.0-600, 1024/2.0);
			pageChecker=2;
		}
		
	
	}
	NSLog(@"PageChecker:%d",pageChecker);
	[self.view setNeedsDisplay];	
	[UIView setAnimationDelegate:self.view];
	
	[UIView commitAnimations];
}

	
	//
//	if ( ( (begin-end) <-40) && pageChecker>0) {
//		NSLog(@"case 1");
//		//NSLog(@"PageChecker:%d",pageChecker);
//		if(pageChecker==1){
//			//self.view.center=CGPointMake(self.view.center.x+600,self.view.center.y);
//			self.view.center=CGPointMake(768/2.0+600, 1024/2.0);
//		}
//		if(pageChecker==2){
//			self.view.center=CGPointMake(768/2.0, 1024/2.0);
//		}	
//		pageChecker=pageChecker-1;
//		NSLog(@"PageChecker:%d",pageChecker);
//	}
//	else if (((begin-end) >40) && pageChecker<2) {
//		NSLog(@"case 2");
//		//NSLog(@"PageChecker:%d",pageChecker);
//		//self.view.center=CGPointMake(self.view.center.x-600,self.view.center.y);
//		if(pageChecker==1){
//			
//			self.view.center=CGPointMake(768/2.0-600, 1024/2.0);
//		}
//		if(pageChecker==0){
//			self.view.center=CGPointMake(768/2.0, 1024/2.0);
//		}	
//		
//		pageChecker=pageChecker+1;
	
	
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

	UITouch *touch = [[event allTouches] anyObject];
	CGPoint beginTouch = [touch locationInView:self.view];
	CGPoint beginTouchSuper = [touch locationInView:self.view.superview];
	beginPoint=beginTouch.x;
	beginPointSuper=beginTouchSuper.x;
	
	
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch = [[event allTouches] anyObject];
	
	CGPoint currentTouch= [touch locationInView:self.view];
	
	currentPoint=currentTouch.x;
	
	
	[UIView beginAnimations:@"move" context:NULL];
	
	[UIView setAnimationDuration:0.005f];
	
			
	if((self.view.center.x+(currentPoint-beginPoint)<1601) && (self.view.center.x+(currentPoint-beginPoint)>-800)){
		 self.view.center=CGPointMake(self.view.center.x+(currentPoint-beginPoint),self.view.center.y);
		
	}
	NSLog(@"where am I?:%f", currentPoint);
	[self.view setNeedsDisplay];	
	[UIView setAnimationDelegate:self.view];
	
	[UIView commitAnimations];
	
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch = [[event allTouches] anyObject];
    CGPoint endTouch = [touch locationInView:self.view.superview];
	
	endPoint=endTouch.x;
	[self moveWithBegin:beginPointSuper withEnd:endPoint];
	//NSLog(@"difference:%f",endPoint-beginPointSuper);
	NSLog(@"I've ended");
	
	
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
	[myScrollView release];
    [self.view release];
    [super dealloc];
}


@end
