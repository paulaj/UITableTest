//
//  RoomCell.h
//  UITableTest
//
//  Created by Paula Jacobs on 6/30/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoomCellView.h"

@interface RoomCell : UIView {
	RoomCellView *roomCellView;
    NSString *room;
}

- (void) setRoom:(NSString *)room;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@property (nonatomic, retain) NSString *room;

@end
