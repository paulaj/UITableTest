//
//  Arrow.m
//  UITableTest
//
//  Created by Paula Jacobs on 6/29/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import "Square.h"
#import "UITableTestAppDelegate.h"


#import "UITableTestMasterViewController.h"

@implementation Square
@class UITableTestMasterViewController;
 
@synthesize directionOfChange;

- (id)initWithFrame:(CGRect)frame withDirectionOfChange:(NSString *)direction withController:(UITableTestMasterViewController *)myController{
    if ((self = [super initWithFrame:(CGRect)frame])) {
		self.directionOfChange=direction;
		self.frame = frame;
		self.userInteractionEnabled=true;
		controller=myController;
	
		
    }
	return self;  
}


- (void)drawRect:(CGRect)rect {
	
	CGContextRef ctx = UIGraphicsGetCurrentContext();

		CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
		CGContextFillRect(ctx, CGRectMake(0,0, self.frame.size.width, self.frame.size.height));		
		
		
	

	
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	if (directionOfChange==@"Left" || directionOfChange==@"BothL") {
		NSLog(@"move left");
		 [controller moveLeft];		
		
	}
	else if (directionOfChange==@"Right" || directionOfChange==@"BothR") {
		NSLog(@"move right");
		[controller moveRight];
	
	
	}
	
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	
	//NSLog(@"End");
	
	//[self setNeedsDisplay];
	
}


- (void)dealloc {
    [super dealloc];
}


@end
