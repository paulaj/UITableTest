//
//  RoomCellView.h
//  UITableTest
//
//  Created by Paula Jacobs on 6/30/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RoomCellView : UIView {
	NSString *room;
}
- (void) setRoom:(NSString *)newRoom;
@end
