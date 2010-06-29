//
//  Arrow.m
//  UITableTest
//
//  Created by Paula Jacobs on 6/29/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import "Arrow.h"
#import "UITableTestAppDelegate.h"


#import "UITableTestMasterViewController.h"

@implementation Arrow
@class UITableTestMasterViewController;
 
@synthesize directionOfChange;

- (id)initWithFrame:(CGRect)frame withDirectionOfChange:(NSString *)directionOfChange withController:(UITableTestMasterViewController *)myController{
    if ((self = [super initWithFrame:(CGRect)frame])) {
		self.directionOfChange=directionOfChange;
		self.frame = frame;
		self.userInteractionEnabled=true;
		controller=myController;
	
		
    }
	return self;  
}


- (void)drawRect:(CGRect)rect {
	
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextSetRGBFillColor(ctx, 0, 0, 0, 1);
	CGContextFillRect(ctx, CGRectMake(0, 0, 25, 25));
	CGContextSetLineWidth(ctx, 4);
	if (directionOfChange==@"Left") {
		CGContextMoveToPoint(ctx, 4, 12.5);
		CGContextAddLineToPoint(ctx, 21, 4);
		CGContextAddLineToPoint(ctx, 21, 21);
		CGContextClosePath(ctx);
		CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
		CGContextSetFillColorWithColor(ctx, [UIColor whiteColor].CGColor);
		CGContextDrawPath(ctx, kCGPathFillStroke);
		
		
		
		
	}
	else if (directionOfChange==@"Right") {
		CGContextMoveToPoint(ctx, 21, 12.5);
		CGContextAddLineToPoint(ctx, 4, 21);
		CGContextAddLineToPoint(ctx, 4, 4);
		CGContextClosePath(ctx);
		CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
		CGContextSetFillColorWithColor(ctx, [UIColor whiteColor].CGColor);
		CGContextDrawPath(ctx, kCGPathFillStroke);
		
	
		
		
	}
	

	
	
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	if (directionOfChange==@"Left") {
		NSLog(@"move left");
		 [controller moveLeft];		
		
	}
	else if (directionOfChange==@"Right") {
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
