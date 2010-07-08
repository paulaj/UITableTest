//
//  LocationCellView.m
//  UITableTest
//
//  Created by Drew Harry on 6/18/10.
//  Copyright 2010 MIT Media Lab. All rights reserved.
//

#import "LocationCellView.h"


@implementation LocationCellView


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        
        self.opaque = YES;
        self.backgroundColor = [UIColor clearColor];
		//self.userInteractionEnabled=true;
    }
    return self;
}

- (void) setLoc:(NSString *)newLoc {
    loc = newLoc;
}





// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    NSString *string =[@" " stringByAppendingString:loc];
    [[UIColor blackColor] set];
    //[[UIImage imageNamed:@"user_suit.png"] drawInRect:CGRectMake(259, 5, 25, 25)];
    [string drawInRect:self.bounds withFont:[UIFont systemFontOfSize:18] lineBreakMode:UILineBreakModeWordWrap alignment:UITextAlignmentLeft];
}

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//		
//	NSLog(@"Chosen Location:%@", loc);
//	
//	
//}
//-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
//}
//
//-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//	
//	
//}
- (void)dealloc {
    [super dealloc];
}


@end
