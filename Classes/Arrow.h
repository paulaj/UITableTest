//
//  Arrow.h
//  UITableTest
//
//  Created by Paula Jacobs on 6/29/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UITableTestMasterViewController;

@interface Arrow : UIView {
	NSString *directionOfChange;
	UITableTestMasterViewController *controller; 

}
- (id)initWithFrame:(CGRect)frame withDirectionOfChange:(NSString *)directionOfChange withController:(UITableTestMasterViewController *)controller;
@property (nonatomic, retain) NSString *directionOfChange ;

@end
