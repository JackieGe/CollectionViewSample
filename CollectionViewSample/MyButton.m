//
//  MyButton.m
//  CollectionViewSample
//
//  Created by jackiege on 17/03/2017.
//  Copyright © 2017 jackiege. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton

+ (instancetype)myButtonWithFrame:(CGRect)frame
                            title:(NSString *)title
                        imageName:(NSString *)imageName {
    MyButton *myButton = [MyButton buttonWithType:UIButtonTypeCustom];
    
    
    myButton.backgroundColor = [UIColor yellowColor];
    myButton.frame = frame;
    [myButton setTitle:title forState:UIControlStateNormal];
    [myButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [myButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    
    [myButton setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 10)];
    [myButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
    
    [myButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    return myButton;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
