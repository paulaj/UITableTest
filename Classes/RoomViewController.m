    //
//  RoomViewController2.m
//  Room
//
//  Created by Paula Jacobs on 6/29/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import "RoomViewController.h"
#import "RoomCell.h"


@implementation RoomViewController

@synthesize roomList;
@synthesize meetingList;
@synthesize countedList;
#define ROW_HEIGHT 60

- (id)initWithFrame:(CGRect)frame {
	if (self = [super init]) {
		
		self.view = [[[UITableView alloc] initWithFrame:CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), 400, 500) style:UITableViewStyleGrouped] autorelease];
		
		[(UITableView *)self.view setDelegate:self];
		[(UITableView *)self.view setDataSource:self];
		
		[self.view setBackgroundColor:[UIColor clearColor]];
		
		
		self.roomList = [NSMutableArray array];
		self.meetingList = [NSMutableArray array];
		self.countedList = [NSMutableArray array];
		
		[roomList addObject:@"Queen's Garden"];
		[roomList addObject:@"Chessboard Forest"];
		[roomList addObject:@"Bizzare Room"];
		[roomList addObject:@"Rabbit Hole"];
		[roomList addObject:@"Mad Hatter's House"];
		[roomList addObject:@"March Hare's House"];
		[roomList addObject:@"CourtRoom"];
		
		[meetingList addObject:@"Very Important"];
		[meetingList addObject:@"#120391"];
		[meetingList addObject:@"#3.14159"];
		[meetingList addObject:@"Dinner"];
		[meetingList addObject:@"Empty"];
		[meetingList addObject:@"Empty"];
		[meetingList addObject:@"Trial"];
		
		[countedList addObject:@"16"];
		[countedList addObject:@"55"];
		[countedList addObject:@"1"];
		[countedList addObject:@"27"];
		[countedList addObject:@"0"];
		[countedList addObject:@"0"];
		[countedList addObject:@"5"];
		
		[roomList addObject:@"Queen's Garden"];
		[roomList addObject:@"Chessboard Forest"];
		[roomList addObject:@"Bizzare Room"];
		[roomList addObject:@"Rabbit Hole"];
		[roomList addObject:@"Mad Hatter's House"];
		[roomList addObject:@"March Hare's House"];
		[roomList addObject:@"CourtRoom"];
		
		[meetingList addObject:@"Very Important"];
		[meetingList addObject:@"#120391"];
		[meetingList addObject:@"#3.14159"];
		[meetingList addObject:@"Dinner"];
		[meetingList addObject:@"Empty"];
		[meetingList addObject:@"Empty"];
		[meetingList addObject:@"Trial"];
		
		[countedList addObject:@"16"];
		[countedList addObject:@"55"];
		[countedList addObject:@"1"];
		[countedList addObject:@"27"];
		[countedList addObject:@"0"];
		[countedList addObject:@"0"];
		[countedList addObject:@"5"];
	}
	return self;
}



- (void)loadView {
    	
}



// Override to allow orientations other than the default portrait orientation.

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}
-(void)willRotateToInterfaceOrientation:
(UIInterfaceOrientation)orientation
							   duration:(NSTimeInterval)duration {
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}





- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	// There is only one section.
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.roomList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    
   
    
    static NSString *CellIdentifier = @"RoomCell";
    
	RoomCell *testCell = (RoomCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(testCell==nil) {
        testCell = [[[RoomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        testCell.frame = CGRectMake(0.0, 0.0, 320.0, ROW_HEIGHT);
    }
    
    NSString *room = [roomList objectAtIndex:indexPath.row];
	testCell.room = room;
	NSString *meeting = [meetingList objectAtIndex:indexPath.row];
	testCell.meeting = meeting;
	NSString *counted = [countedList objectAtIndex:indexPath.row];
	testCell.counted = counted;
 	
    return testCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"You have selected the %@" , [roomList objectAtIndex:indexPath.row]);
		if ([[meetingList objectAtIndex:indexPath.row] isEqualToString:@"Empty"]){
			NSLog(@"This room is available.");
		}
		else {
			NSLog(@"This room contains The %@ Meeting and has %@ members.", [meetingList objectAtIndex:indexPath.row], [countedList objectAtIndex:indexPath.row]); 
		}
    
	
	
    
}
- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [super dealloc];
}

@end
