//
//  LocationViewController.m
//  UITableTest
//
//  Created by Drew Harry on 6/18/10.
//  Copyright MIT Media Lab 2010. All rights reserved.
//

#import "LocationViewController.h"
#import "LocationCell.h"
#import "UITableTestMasterViewController.h"

@implementation LocationViewController

@synthesize locList;

#define ROW_HEIGHT 60

- (id)initWithFrame:(CGRect)frame {
	if (self = [super init]) {
		//self.view = [[[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain] autorelease];
		//CGFloat viewWidth=CGRectGetWidth(frame);
		self.view = [[[UITableView alloc] initWithFrame:CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), 300, 400) style:UITableViewStylePlain] autorelease];
		
		[(UITableView *)self.view setDelegate:self];
		[(UITableView *)self.view setDataSource:self];
		
		[self.view setBackgroundColor:[UIColor blackColor]];
		
		
		self.locList = [NSMutableArray array];
		[locList addObject:@"Here"];
		[locList addObject:@"There"];
		[locList addObject:@"Everywhere"];
		[locList addObject:@"Underwear"];
		[locList addObject:@"In Your Hair"];
		[locList addObject:@"Fight a Bear"];
		[locList addObject:@"With Your Chair"];
		//NSLog(@":%@", self.locList);
		
		UILabel *label = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 50)] autorelease];
		label.backgroundColor = [UIColor clearColor];
		label.font = [UIFont boldSystemFontOfSize:50];
		label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.8];
		label.textAlignment = UITextAlignmentCenter;
		label.textColor = [UIColor redColor];
		label.text = @"Locations";
		UITableView *myTable = (UITableView *)self.view;
		myTable.tableHeaderView = label;
		
		
		
		
				//self.title = @"My Awesome Test Table";
		//self.frame=CGRectMake(0, 0, 100, 500);
		//self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
		//self.tableView.rowHeight = ROW_HEIGHT;
       // self.nameList = [NSMutableArray array];
	}
	return self;
}



- (void)loadView {
    // allocate the subclassed UIView, and set it as the UIViewController's main view
		
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


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
	return [self.locList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    //NSLog(@"Got tableView call");
    
    static NSString *CellIdentifier = @"UITableTestCell";
    
	LocationCell *testCell = (LocationCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(testCell==nil) {
        testCell = [[[LocationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        testCell.frame = CGRectMake(0.0, 0.0, 320.0, ROW_HEIGHT);
    }
    
    NSString *loc = [locList objectAtIndex:indexPath.row];
	testCell.loc = loc;
 	
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
