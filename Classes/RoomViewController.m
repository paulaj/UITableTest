    //
//  UITableTestViewController2.m
//  UITableTest
//
//  Created by Paula Jacobs on 6/29/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import "RoomViewController.h"
#import "UITableTestCell.h"


@implementation RoomViewController

@synthesize roomList;

#define ROW_HEIGHT 60

//- (id)initWithFrame:(CGRect)frame {
//if (self = [super initWithFrame:frame]) {
//	self.title = @"My Awesome Test Table";
//self.frame=CGRectMake(0, 0, 100, 500);
//		self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
//		self.tableView.rowHeight = ROW_HEIGHT;
// self.nameList = [NSMutableArray array];
//}
//return self;
//}
//


- (void)loadView {
    // allocate the subclassed UIView, and set it as the UIViewController's main view
    self.view = [[[UITableView alloc] initWithFrame:CGRectMake(700, 200, 320, 460) style:UITableViewStylePlain] autorelease];
	[(UITableView *)self.view setDelegate:self];
	[(UITableView *)self.view setDataSource:self];
	
	[self.view setBackgroundColor:[UIColor blackColor]];
	
	
	self.roomList = [NSMutableArray array];
	//[nameList addObject:@"Drew"];
    [roomList addObject:@"Queen's Garden"];
    [roomList addObject:@"Chessboard Forest"];
    [roomList addObject:@"Bizzare Room"];
	[roomList addObject:@"Rabbit Hole"];
	[roomList addObject:@"Mad Hatter's House"];
	[roomList addObject:@"March Hare's House"];
	[roomList addObject:@"CourtRoom"];
	
	
	//NSLog(@":%@", self.nameList);
	UILabel *label = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 50)] autorelease];
	label.backgroundColor = [UIColor clearColor];
	label.font = [UIFont boldSystemFontOfSize:50];
	label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.8];
	label.textAlignment = UITextAlignmentCenter;
	label.textColor = [UIColor redColor];
	label.text = @"Rooms";
	UITableView *myTable = (UITableView *)self.view;
	myTable.tableHeaderView = label;
	
	
	
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
    
    static NSString *CellIdentifier = @"UITableTestCell";
    
	UITableTestCell *testCell = (UITableTestCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(testCell==nil) {
        testCell = [[[UITableTestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        testCell.frame = CGRectMake(0.0, 0.0, 320.0, ROW_HEIGHT);
    }
    
    NSString *room = [roomList objectAtIndex:indexPath.row];
	testCell.name = room;
 	
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
