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
	CGContextFillRect(ctx, CGRectMake(0,0, self.frame.size.width, self.frame.size.height));
	CGFloat lineSize= self.frame.size.width/8.0;
	CGContextSetLineWidth(ctx, lineSize);
	
	if (directionOfChange==@"Left") {
		CGContextMoveToPoint(ctx, lineSize, self.frame.size.height/2.0);
		CGContextAddLineToPoint(ctx, self.frame.size.width, lineSize);
		CGContextAddLineToPoint(ctx, self.frame.size.width, self.frame.size.height);
		CGContextClosePath(ctx);
		CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
		CGContextSetFillColorWithColor(ctx, [UIColor whiteColor].CGColor);
		CGContextDrawPath(ctx, kCGPathFillStroke);
		
		
		
		
	}
	else if (directionOfChange==@"Right") {
		CGContextMoveToPoint(ctx, self.frame.size.width, self.frame.size.height/2.0);
		CGContextAddLineToPoint(ctx, lineSize,self.frame.size.height);
		CGContextAddLineToPoint(ctx, lineSize, lineSize);
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
