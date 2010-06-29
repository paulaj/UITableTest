//
//  Border.m
//  Tin-Can-Whiteboard
//
//  Created by Paula Jacobs on 6/29/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import "Borders.h"


@implementation Borders
@class UITableTestAppDelegate

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
		self.backgroundColor =[UIColor blueColor];
		[self setNeedsDisplay];
		self.frame = frame;
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
}

- (void)dealloc {
    [super dealloc];
}


@end
