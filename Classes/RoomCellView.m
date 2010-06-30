//
//  RoomCellView.m
//  UITableTest
//
//  Created by Paula Jacobs on 6/30/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import "RoomCellView.h"


@implementation RoomCellView


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        
        self.opaque = YES;
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

- (void) setRoom:(NSString *)newRoom {
    room = newRoom;
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
    NSString *string =room;
	
    [[UIColor whiteColor] set];
    [string drawInRect:self.bounds withFont:[UIFont systemFontOfSize:18] lineBreakMode:UILineBreakModeWordWrap alignment:UITextAlignmentLeft];
}


- (void)dealloc {
    [super dealloc];
}

@end
