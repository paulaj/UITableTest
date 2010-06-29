//
//  LogoView.m
//  UITableTest
//
//  Created by Paula Jacobs on 6/29/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import "LogoView.h"


@implementation LogoView


- (id)initWithImage:(UIImage *)image withFrame:(CGRect)frame{
    if ((self = [super initWithImage:image])) {
       
		[self setNeedsDisplay];
		self.frame = frame;
		
		
    }
	return self;  
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc {
    [super dealloc];
}


@end
