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
@class UITableTestMasterViewController;
@synthesize locList;


#define ROW_HEIGHT 60

- (id)initWithFrame:(CGRect)frame withController:(UITableTestMasterViewController *)control{
	if (self = [super init]) {
		//self.view = [[[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain] autorelease];
		//CGFloat viewWidth=CGRectGetWidth(frame);
		self.view = [[[UITableView alloc] initWithFrame:CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), 400, 500) style:UITableViewStyleGrouped] autorelease];
		
		[(UITableView *)self.view setDelegate:self];
		[(UITableView *)self.view setDataSource:self];
		
		[self.view setBackgroundColor:[UIColor clearColor]];
		
		
		self.locList = [NSMutableArray array];
		[locList addObject:@"Here"];
		[locList addObject:@"There"];
		[locList addObject:@"Everywhere"];
		[locList addObject:@"Underwear"];
		[locList addObject:@"In Your Hair"];
		[locList addObject:@"Fight a Bear"];
		[locList addObject:@"With Your Chair"];
		[locList addObject:@"Here"];
		[locList addObject:@"There"];
		[locList addObject:@"Everywhere"];
		[locList addObject:@"Underwear"];
		[locList addObject:@"In Your Hair"];
		[locList addObject:@"Fight a Bear"];
		[locList addObject:@"With Your Chair"];
		//NSLog(@":%@", self.locList);
		
		controller=control;
		
				
		
	}
	return self;
}



- (void)loadView {
    // allocate the subclassed UIView, and set it as the UIViewController's main view
	
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}
-(void)willRotateToInterfaceOrientation:
(UIInterfaceOrientation)orientation
							   duration:(NSTimeInterval)duration {
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
    [controller ChooseLocationWithLocation:[locList objectAtIndex:indexPath.row]];
	
	
    
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
