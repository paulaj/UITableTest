//
//  ContinueButton.h
//  UITableTest
//
//  Created by Paula Jacobs on 7/7/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UITableTestMasterViewController;

@interface ContinueButton : UIView {
	UITableTestMasterViewController *controller; 
	bool disable;
	
}
- (id)initWithFrame:(CGRect)frame;
@property (nonatomic, retain) NSString *directionOfChange ;
@property (nonatomic, assign) bool disable;
@end
