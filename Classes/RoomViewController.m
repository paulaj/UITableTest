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
		//self.view = [[[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain] autorelease];
		//CGFloat viewWidth=CGRectGetWidth(frame);
		self.view = [[[UITableView alloc] initWithFrame:CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), 400, 500) style:UITableViewStyleGrouped] autorelease];
		
		[(UITableView *)self.view setDelegate:self];
		[(UITableView *)self.view setDataSource:self];
		
		[self.view setBackgroundColor:[UIColor whiteColor]];
		
		
		self.roomList = [NSMutableArray array];
		self.meetingList = [NSMutableArray array];
		self.countedList = [NSMutableArray array];
		//[countedList addObject:@"Drew"];
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
		UILabel *label = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 50)] autorelease];
		label.backgroundColor = [UIColor colorWithRed:0 green:.3 blue:.8 alpha:1];
		label.font = [UIFont boldSystemFontOfSize:50];
		label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.8];
		label.textAlignment = UITextAlignmentCenter;
		label.textColor = [UIColor whiteColor];
		label.text = @"Rooms";
		UITableView *myTable = (UITableView *)self.view;
		myTable.tableHeaderView = label;
		
			
		
		//self.title = @"My Awesome Test Table";
		//self.frame=CGRectMake(0, 0, 100, 500);
		//self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
		//self.tableView.rowHeight = ROW_HEIGHT;
		// self.countedList = [NSMutableArray array];
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic -- create and push a new view controller
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
    
    NSLog(@"Got tableView call");
    
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
- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [super dealloc];
}

@end
