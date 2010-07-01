//
//  LocationCell.m
//  UITableTest
//
//  Created by Drew Harry on 6/18/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import "LocationCell.h"


@implementation LocationCell

@synthesize loc;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        
        CGRect tzvFrame = CGRectMake(0.0, 0.0, 320, self.contentView.bounds.size.height);

        locCellView = [[LocationCellView alloc] initWithFrame:tzvFrame];
        locCellView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        [self.contentView addSubview:locCellView];
    }
    return self;
}

- (void)setLoc:(NSString *)newLoc {
    
    [locCellView setLoc:newLoc];
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}


- (void)dealloc {
    [super dealloc];
}


@end
