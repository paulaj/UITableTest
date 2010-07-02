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
@synthesize disable;

- (id)initWithFrame:(CGRect)frame withDirectionOfChange:(NSString *)directionOfChange withController:(UITableTestMasterViewController *)myController{
    if ((self = [super initWithFrame:(CGRect)frame])) {
		self.directionOfChange=directionOfChange;
		self.frame = frame;
		self.userInteractionEnabled=true;
		controller=myController;
		disable=false;
		
    }
	return self;  
}


- (void)drawRect:(CGRect)rect {
	
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextSetRGBFillColor(ctx, 0, 0, 0, 1);
	CGContextFillRect(ctx, CGRectMake(0,0, self.frame.size.width, self.frame.size.height));
	CGFloat lineSize= self.frame.size.width/8.0;
	CGContextSetLineWidth(ctx, lineSize);
	if (disable==false) {
		CGContextSetRGBStrokeColor(ctx, .7, .7, .7, 1);
		CGContextSetRGBFillColor(ctx, 1, 1, 1, 1);
		
	}
	
	if (disable==true) {
		CGContextSetRGBStrokeColor(ctx, .7, .7, .7, .05);
		CGContextSetRGBFillColor(ctx, 1, 1, 1, .3);
		
	}

	if (directionOfChange==@"Left") {
		CGContextMoveToPoint(ctx, lineSize, self.frame.size.height/2.0);
		CGContextAddLineToPoint(ctx, self.frame.size.width-lineSize, lineSize);
		CGContextAddLineToPoint(ctx, self.frame.size.width-lineSize, self.frame.size.height-lineSize);
		CGContextClosePath(ctx);
		CGContextDrawPath(ctx, kCGPathFillStroke);	
		
	}
	
	
	if (directionOfChange==@"Right") {
		CGContextMoveToPoint(ctx, self.frame.size.width-lineSize, self.frame.size.height/2.0);
		CGContextAddLineToPoint(ctx, lineSize,self.frame.size.height-lineSize);
		CGContextAddLineToPoint(ctx, lineSize, lineSize);
		CGContextClosePath(ctx);
		CGContextDrawPath(ctx, kCGPathFillStroke);
	}
	NSLog(@"Calling DrawRect");
	NSLog(@"disable?:%d:",disable);
	[self setNeedsDisplay];
	
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	if (directionOfChange==@"Left" & disable==false) {
		NSLog(@"move left");
		
		[controller moveLeft];	
		[self setNeedsDisplay];
		
	}
	else if (directionOfChange==@"Right" & disable==false) {
		NSLog(@"move right");
		[controller moveRight];
		[self setNeedsDisplay];
	
	
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
