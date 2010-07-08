//
//  ContinueButton.m
//  UITableTest
//
//  Created by Paula Jacobs on 7/7/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import "ContinueButton.h"

#import "UITableTestAppDelegate.h"


#import "UITableTestMasterViewController.h"

@implementation ContinueButton
@class UITableTestMasterViewController;

@synthesize disable;

- (id)initWithFrame:(CGRect)frame{ 
    if ((self = [super initWithFrame:(CGRect)frame])) {
		self.frame = frame;
		self.userInteractionEnabled=true;
		disable=false;
		
    }
	return self;  
}


- (void)drawRect:(CGRect)rect {
	
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextSetRGBFillColor(ctx, 0, 0, 0, 1);
	CGContextFillRect(ctx, CGRectMake(0,0, self.frame.size.width, self.frame.size.height));

	//Triangle 	
	CGContextSetRGBFillColor(ctx, 0, .3, .8, 1);
	CGContextMoveToPoint(ctx, self.frame.size.width, self.frame.size.height/2.0);
	CGContextAddLineToPoint(ctx, self.frame.size.width/4.0,self.frame.size.height+100);
	CGContextAddLineToPoint(ctx, self.frame.size.width/4.0, -100);
	CGContextClosePath(ctx);
	CGContextDrawPath(ctx, kCGPathFillStroke);
	
	
	//Rectangle with text
	NSString *message =@"Continue\nTo User\n Selection";
	CGContextFillRect(ctx, CGRectMake(0,0, 3.0*self.frame.size.width/4.0, self.frame.size.height));
	[[UIColor whiteColor] set];
    [message drawInRect:CGRectMake(0,0, 3.0*self.frame.size.width/4.0, self.frame.size.height) withFont:[UIFont systemFontOfSize:25] lineBreakMode:UILineBreakModeWordWrap alignment:UITextAlignmentCenter];
	
	[self setNeedsDisplay];
	
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"Got Touch");
	
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	
	
}


- (void)dealloc {
    [super dealloc];
}


@end
