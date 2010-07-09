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


- (void)loadView {
	
	pageChecker=0;//keeps track of page
	
	self.view= [[UIView alloc] initWithFrame:CGRectMake(0,0, 2000.0, 700.0) ];
	self.view.center= CGPointMake(768/2.0+600, 1024/2.0);
	chosenRoom=NULL;
	chosenLocation=NULL;
	
	
	
	//dimentions
	CGFloat arrowSize= self.view.frame.size.width/30.0;
	CGFloat arrowSpace=self.view.frame.size.width/8.50;
	CGFloat picSize= self.view.frame.size.width/4.0;
	CGFloat locSizeX=400.0;
	CGFloat locSizeY=500.0;
	
	
	
	//Elements for our view
	LogoView *picView= [[[LogoView alloc] initWithImage:[UIImage imageNamed:@"tin_can_phone.jpg"] 
											  withFrame: CGRectMake(self.view.frame.size.width/2.0-(1.5*arrowSpace)-(1.5*arrowSize)-(picSize)+arrowSize , self.view.frame.size.height/2.0 -(picSize/2.0), picSize, picSize) ] retain];
	
	LocationViewController *locViewController = [[[LocationViewController alloc] 
			initWithFrame:CGRectMake(self.view.frame.size.width/2.0-(locSizeX/2.0) , self.view.frame.size.height/2.0-(locSizeY/2.0), locSizeX, locSizeY) withController:self] retain];
	RoomViewController *roomViewController = [[[RoomViewController alloc] 
											   initWithFrame:CGRectMake(self.view.frame.size.width/2.0+(1.5*arrowSpace)+(arrowSpace-(locSizeX/2.0)) , self.view.frame.size.height/2.0-(locSizeY/2.0), locSizeX, locSizeY) withController:self] retain];
	
	
	
	
	
	roundedButtonType = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
	roundedButtonType.frame = CGRectMake(self.view.frame.size.width/2.0+(1.5*arrowSpace)+(arrowSpace-(locSizeX/2.0) +locSizeX +(arrowSize/2.0))+20 , self.view.frame.size.height/2.0-48, 125, 75);
	roundedButtonType.backgroundColor = [UIColor clearColor];
	[roundedButtonType setTitle:@"Login" forState: UIControlStateNormal];
	[roundedButtonType setFont:[UIFont boldSystemFontOfSize:30.0f]];
	[roundedButtonType addTarget:self action:@selector(infoButtonPressed:)forControlEvents:UIControlEventTouchUpInside];
	roundedButtonType.adjustsImageWhenDisabled = YES;
	[roundedButtonType setEnabled: NO];
	//[roundedButtonType setTitleColor:[UIColor blueColor] forState: UIControlStateNormal];
	
	if( roundedButtonType.enabled==NO){
		UILabel *loginInstructions = [[UILabel alloc]
									  initWithFrame:CGRectMake(self.view.frame.size.width/2.0+(1.5*arrowSpace)+(arrowSpace-(locSizeX/2.0) +locSizeX +(arrowSize/2.0))+20,  self.view.frame.size.height/2.0+25, 125,200)];
		loginInstructions.text = @"Have not chosen \n a Location \nAND\n a Room";
		loginInstructions.numberOfLines = 0;
		loginInstructions.textAlignment = UITextAlignmentCenter;
		loginInstructions.textColor = [UIColor redColor];
		loginInstructions.backgroundColor = [UIColor clearColor];
		loginInstructions.font = [UIFont boldSystemFontOfSize:20.0f];
		[self.view addSubview:loginInstructions];
		[loginInstructions release];
		
	}
	
	
	//Headers
	HeaderView *headerLocation =[[[HeaderView alloc] 
			initWithFrame:CGRectMake(self.view.frame.size.width/2.0-(locSizeX/2.0) , self.view.frame.size.height/2.0-(locSizeY/2.0)-60, locSizeX, 60) withTitle:@"Locations"] retain];
	HeaderView *headerRoom =[[[HeaderView alloc] 
			initWithFrame:CGRectMake(self.view.frame.size.width/2.0+(1.5*arrowSpace)+(arrowSpace-(locSizeX/2.0)) , self.view.frame.size.height/2.0-(locSizeY/2.0)-60, locSizeX, 60) withTitle:@"Rooms"] retain];
	
    
	
	//Borders
	UIView *borderView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2.0-(locSizeX/2.0) -2, self.view.frame.size.height/2.0-(locSizeY/2.0)-62, locSizeX+4,locSizeY+64)];
	[borderView setBackgroundColor:[UIColor grayColor]];
	[self.view addSubview:borderView];
	[borderView release];
	
	
	
	UIView *border2View = [[UIView alloc] initWithFrame:
						   CGRectMake(self.view.frame.size.width/2.0+(1.5*arrowSpace)+(arrowSpace-(locSizeX/2.0))-2, self.view.frame.size.height/2.0-(locSizeY/2.0)-62, locSizeX+4,locSizeY+64)];
	[border2View setBackgroundColor:[UIColor grayColor]];
	[self.view addSubview:border2View];
	[border2View release];
	
	

	//Instruction text
	UILabel *picInstructions = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2.0-(1.5*arrowSpace)-(1.5*arrowSize)-(picSize)+arrowSize+20 , self.view.frame.size.height/2.0-(locSizeY/2.0)+locSizeY+50, locSizeX+4,100)];
	picInstructions.text = @"Slide -->";
	picInstructions.numberOfLines = 0;
	picInstructions.textAlignment = UITextAlignmentCenter;
	picInstructions.textColor = [UIColor whiteColor];
	picInstructions.backgroundColor = [UIColor clearColor];
	picInstructions.font = [UIFont boldSystemFontOfSize:30.0f];
	[self.view addSubview:picInstructions];
	[picInstructions release];
	
	UILabel *locInstructions = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2.0-(locSizeX/2.0), self.view.frame.size.height/2.0-(locSizeY/2.0)+locSizeY+50, locSizeX+4,100)];
	locInstructions.text = @"Slide -->";
	locInstructions.numberOfLines = 0;
	locInstructions.textAlignment = UITextAlignmentCenter;
	locInstructions.textColor = [UIColor whiteColor];
	locInstructions.backgroundColor = [UIColor clearColor];
	locInstructions.font = [UIFont boldSystemFontOfSize:30.0f];
	[self.view addSubview:locInstructions];
	[locInstructions release];
	
	UILabel *loc2Instructions = [[UILabel alloc] 
								  initWithFrame:CGRectMake(self.view.frame.size.width/2.0-(locSizeX/2.0), self.view.frame.size.height/2.0-(locSizeY/2.0)+locSizeY, locSizeX+4,50)];
	loc2Instructions.numberOfLines = 0;
	loc2Instructions.text = @"Choose Your Physical Location.";
	loc2Instructions.textAlignment = UITextAlignmentCenter;
	loc2Instructions.textColor = [UIColor whiteColor];
	loc2Instructions.backgroundColor = [UIColor blackColor];
	loc2Instructions.font = [UIFont boldSystemFontOfSize:20.0f];
	[self.view addSubview:loc2Instructions];
	
	UILabel *room2Instructions = [[UILabel alloc] 
								  initWithFrame:CGRectMake(self.view.frame.size.width/2.0+(1.5*arrowSpace)+(arrowSpace-(locSizeX/2.0)), self.view.frame.size.height/2.0-(locSizeY/2.0)+locSizeY, locSizeX+4,50)];
	room2Instructions.numberOfLines = 0;
	room2Instructions.text = @"Choose A Virtual Room.";
	room2Instructions.textAlignment = UITextAlignmentCenter;
	room2Instructions.textColor = [UIColor whiteColor];
	room2Instructions.backgroundColor = [UIColor blackColor];
	room2Instructions.font = [UIFont boldSystemFontOfSize:20.0f];
	[self.view addSubview:room2Instructions];
	[room2Instructions release];
	//
//	UILabel *loc2Instructions = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2.0-(locSizeX/2.0), self.view.frame.size.height/2.0-(locSizeY/2.0)-4.0*(self.view.frame.size.height/2.0-(locSizeY/2.0)-60), locSizeX+4,75)];
//	loc2Instructions.text = @"Choose Location";
//	loc2Instructions.numberOfLines = 0;
//	loc2Instructions.textAlignment = UITextAlignmentCenter;
//	loc2Instructions.textColor = [UIColor whiteColor];
//	loc2Instructions.backgroundColor = [UIColor clearColor];
//	loc2Instructions.font = [UIFont boldSystemFontOfSize:30.0f];
//	[self.view addSubview:loc2Instructions];
//	[loc2Instructions release];
//	
//	UILabel *roomInstructions = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2.0+(1.5*arrowSpace)+(arrowSpace-(locSizeX/2.0)), self.view.frame.size.height/2.0-(locSizeY/2.0)-4.0*(self.view.frame.size.height/2.0-(locSizeY/2.0)-60), locSizeX+4,75)];
//	roomInstructions.text = @"Choose Room";
//	roomInstructions.numberOfLines = 0;
//	roomInstructions.textAlignment = UITextAlignmentCenter;
//	roomInstructions.textColor = [UIColor whiteColor];
//	roomInstructions.backgroundColor = [UIColor clearColor];
//	roomInstructions.font = [UIFont boldSystemFontOfSize:30.0f];
//	[self.view addSubview:roomInstructions];
//	[roomInstructions release];
	
	[self.view setBackgroundColor:[UIColor blackColor]]; 
	[self.view addSubview:picView];
	[self.view addSubview:locViewController.view];
	[self.view addSubview:roomViewController.view];
	[self.view addSubview:roundedButtonType];
	[self.view addSubview:headerLocation];
	[self.view addSubview:headerRoom];
	
	[self.view setNeedsDisplay];
	
	
}

-(void)infoButtonPressed:(id)sender{
	
	NSLog(@"I have been pressed");
}

-(void)ChooseLocationWithLocation:(NSString *)loc{
	CGFloat arrowSpace=self.view.frame.size.width/8.50;
	CGFloat arrowSize= self.view.frame.size.width/30.0;
	CGFloat locSizeX=400.0;
	CGFloat locSizeY=500.0;
	
	chosenLocation= loc;
	
	//UILabel *loc2Instructions = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2.0-(locSizeX/2.0), self.view.frame.size.height/2.0-(locSizeY/2.0)-4.0*(self.view.frame.size.height/2.0-(locSizeY/2.0)-60), locSizeX+4,75)];
//	loc2Instructions.text = [@"Location: " stringByAppendingString:loc];
//	loc2Instructions.numberOfLines = 0;
//	loc2Instructions.textAlignment = UITextAlignmentCenter;
//	loc2Instructions.textColor = [UIColor whiteColor];
//	loc2Instructions.backgroundColor = [UIColor blackColor];
//	loc2Instructions.font = [UIFont boldSystemFontOfSize:30.0f];
//	[self.view addSubview:loc2Instructions];
//	[loc2Instructions release];
	
	
	UILabel *loginInstructions = [[UILabel alloc]
								  initWithFrame:CGRectMake(self.view.frame.size.width/2.0+(1.5*arrowSpace)+(arrowSpace-(locSizeX/2.0) +locSizeX +(arrowSize/2.0))+20,  self.view.frame.size.height/2.0+25, 125,200)];
	loginInstructions.numberOfLines = 0;
	loginInstructions.textAlignment = UITextAlignmentCenter;
	loginInstructions.textColor = [UIColor redColor];
	loginInstructions.backgroundColor = [UIColor blackColor];
	loginInstructions.font = [UIFont boldSystemFontOfSize:20.0f];
	[self.view addSubview:loginInstructions];
	
	NSLog(@"Location:%@ \n", loc);
	if(chosenRoom!=NULL){
		[roundedButtonType setEnabled: YES];
		loginInstructions.text = @" ";
	}
	else{
		loginInstructions.text = @"Have not choosen \n a Room";
	}
	
	[loginInstructions release];
}		
-(void)ChooseRoomWithRoom:(NSString *)room withMeeting:(NSString *)meeting withCount:(NSString*)counted{
	CGFloat arrowSpace=self.view.frame.size.width/8.50;
	CGFloat arrowSize= self.view.frame.size.width/30.0;
	CGFloat locSizeX=400.0;
	CGFloat locSizeY=500.0;
	
	
	
	
	chosenRoom= room;
	
	
	//UILabel *roomInstructions = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2.0+(1.5*arrowSpace)+(arrowSpace-(locSizeX/2.0)), self.view.frame.size.height/2.0-(locSizeY/2.0)-4.0*(self.view.frame.size.height/2.0-(locSizeY/2.0)-60), locSizeX+4,75)];
//	roomInstructions.text = [@"Room: " stringByAppendingString:room];
//	roomInstructions.numberOfLines = 0;
//	roomInstructions.textAlignment = UITextAlignmentCenter;
//	roomInstructions.textColor = [UIColor whiteColor];
//	roomInstructions.backgroundColor = [UIColor blackColor];
//	roomInstructions.font = [UIFont boldSystemFontOfSize:30.0f];
//	[self.view addSubview:roomInstructions];
//	[roomInstructions release];
	
	
	
//	UILabel *room2Instructions = [[UILabel alloc] 
//								  initWithFrame:CGRectMake(self.view.frame.size.width/2.0+(1.5*arrowSpace)+(arrowSpace-(locSizeX/2.0)), self.view.frame.size.height/2.0-(locSizeY/2.0)+locSizeY, locSizeX+4,100)];
//	room2Instructions.numberOfLines = 0;
//	room2Instructions.textAlignment = UITextAlignmentCenter;
//	room2Instructions.textColor = [UIColor whiteColor];
//	room2Instructions.backgroundColor = [UIColor blackColor];
//	room2Instructions.font = [UIFont boldSystemFontOfSize:20.0f];
//	[self.view addSubview:room2Instructions];
	
	
	UILabel *loginInstructions = [[UILabel alloc]
								  initWithFrame:CGRectMake(self.view.frame.size.width/2.0+(1.5*arrowSpace)+(arrowSpace-(locSizeX/2.0) +locSizeX +(arrowSize/2.0))+20,  self.view.frame.size.height/2.0+25, 125,200)];
	loginInstructions.numberOfLines = 0;
	loginInstructions.textAlignment = UITextAlignmentCenter;
	loginInstructions.textColor = [UIColor redColor];
	loginInstructions.backgroundColor = [UIColor blackColor];
	loginInstructions.font = [UIFont boldSystemFontOfSize:20.0f];
	[self.view addSubview:loginInstructions];
	
	
	if ([meeting isEqualToString:@"Empty"]){
		//room2Instructions.text = @"This room is available.";
	}
	else {
		//room2Instructions.text = [[[[@"This room contains The " stringByAppendingString:meeting] stringByAppendingString:@" Meeting and has "] stringByAppendingString:counted] stringByAppendingString:@" members." ]; 
	}
	
	
	
	
	if(chosenLocation!=NULL){
		[roundedButtonType setEnabled: YES];
		loginInstructions.text = @" ";
	}
	else{
		loginInstructions.text = @"Have not chosen \n a Location";
	}
	
	
	
	[loginInstructions release];
	
}		
//Decides what movement to take based on our current location (pageChecker) and the size and direction of our stroke (begin-end)
-(void)moveWithBegin:(CGFloat)begin withEnd:(CGFloat)end{
	
	[UIView beginAnimations:@"move_to_Left" context:NULL];
	[UIView setAnimationDuration:.50f];
	
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

	[self.view setNeedsDisplay];	
	[UIView setAnimationDelegate:self.view];
	[UIView commitAnimations];
}

	
	



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
	
	//If movement is within our range (so they don't go too far off screen)		
	if((self.view.center.x+(currentPoint-beginPoint)<1601) && (self.view.center.x+(currentPoint-beginPoint)>-800)){
		 self.view.center=CGPointMake(self.view.center.x+(currentPoint-beginPoint),self.view.center.y);
	}
	
	
	[self.view setNeedsDisplay];	
	[UIView setAnimationDelegate:self.view];
	[UIView commitAnimations];
	
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch = [[event allTouches] anyObject];
    CGPoint endTouch = [touch locationInView:self.view.superview];
	endPoint=endTouch.x;
	[self moveWithBegin:beginPointSuper withEnd:endPoint];

	
	
}



- (void)viewDidLoad {
    [super viewDidLoad];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)dealloc {
    [self.view release];
    [super dealloc];
}


@end
