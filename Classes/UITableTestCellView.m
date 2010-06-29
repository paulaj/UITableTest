//
//  UITableTestCellView.m
//  UITableTest
//
//  Created by Drew Harry on 6/18/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import "UITableTestCellView.h"


@implementation UITableTestCellView


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        
        self.opaque = YES;
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

- (void) setName:(NSString *)newName {
    name = newName;
}


- (void)setHighlighted:(BOOL)lit {
	// If highlighted state changes, need to redisplay.
    if(lit) {
        self.backgroundColor = [UIColor blackColor];
    } else {
        self.backgroundColor = [UIColor blackColor];
    }
    
    [self setNeedsDisplay];    
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    NSString *string =[@"       " stringByAppendingString:name];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
	CGContextAddArc(ctx, 10, 10, 4, 0, 2*M_PI , 0); 
	CGContextFillPath(ctx);
	
    [[UIColor whiteColor] set];
    [[UIImage imageNamed:@"user_suit.png"] drawInRect:CGRectMake(259, 5, 25, 25)];
    [string drawInRect:self.bounds withFont:[UIFont systemFontOfSize:18] lineBreakMode:UILineBreakModeWordWrap alignment:UITextAlignmentLeft];
}


- (void)dealloc {
    [super dealloc];
}


@end
