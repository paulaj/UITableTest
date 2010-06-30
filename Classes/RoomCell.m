//
//  RoomCell.m
//  UITableTest
//
//  Created by Paula Jacobs on 6/30/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import "RoomCell.h"


@implementation RoomCell


@synthesize room;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        
        CGRect tzvFrame = CGRectMake(0.0, 0.0, 320, self.bounds.size.height);
		
        roomCellView = [[RoomCellView alloc] initWithFrame:tzvFrame];
        roomCellView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        [self addSubview:roomCellView];
    }
    return self;
}

- (void)setRoom:(NSString *)newRoom {
    
    [roomCellView setRoom:newRoom];
}

- (void)dealloc {
    [super dealloc];
}


@end
