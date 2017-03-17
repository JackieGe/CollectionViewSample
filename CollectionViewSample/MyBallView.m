//
//  MyBallView.m
//  CollectionViewSample
//
//  Created by jackiege on 17/03/2017.
//  Copyright © 2017 jackiege. All rights reserved.
//

#import "MyBallView.h"

@interface MyBallView ()
@property (nonatomic, assign)CGPoint startPoint;
@end

@implementation MyBallView

- (instancetype)initWithFrame:(CGRect)frame {
    
    assert(frame.size.width == frame.size.height);
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        self.layer.cornerRadius = frame.size.width/2;
        self.layer.masksToBounds = YES;
    }
    
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"MyBallView touch began");
    UITouch *touch = [touches anyObject];
    self.startPoint = [touch locationInView:self];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
     NSLog(@"MyBallView touch moved");
    
    UITouch *newTouch = [touches anyObject];
    CGPoint newPoint = [newTouch locationInView:self];
    CGFloat dx = newPoint.x - self.startPoint.x;
    CGFloat dy = newPoint.y - self.startPoint.y;
    
    self.center = CGPointMake(self.center.x + dx, self.center.y + dy);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
