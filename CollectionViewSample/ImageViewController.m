//
//  ImageViewController.m
//  CollectionViewSample
//
//  Created by jackiege on 17/03/2017.
//  Copyright © 2017 jackiege. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()
{
    long count;;
}

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imageV =  [[UIImageView alloc] initWithFrame:CGRectMake(20, 50, 200, 200)];
    UIImage *image =[UIImage imageNamed:@"badminton.gif"];
    imageV.image = image;
    [self.view addSubview:imageV];
    
    imageV.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMe)];
    tap.numberOfTapsRequired = 2; //double click
    [imageV addGestureRecognizer:tap];
    
    
    //long press
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressMe:)];
    longPress.minimumPressDuration = 3;
    longPress.allowableMovement = 10;
    [imageV addGestureRecognizer:longPress];
    
    count = 0;
    
    // swipe
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeMe:)];
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [imageV addGestureRecognizer:swipeUp];
    
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeMe:)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [imageV addGestureRecognizer:swipeDown];
    
    
}

- (void)tapMe {
    NSLog(@"tap me");
}

- (void)longPressMe:(UILongPressGestureRecognizer *)longPress {
    switch (longPress.state) {
        case UIGestureRecognizerStateBegan:
            NSLog(@"Long press began");
            break;
        case UIGestureRecognizerStateChanged:
            count++;
            NSLog(@"Long press changed @ %ld", count);
            break;
        case UIGestureRecognizerStateEnded:
            NSLog(@"Long press ended");
            break;
        default:
            break;
    }
}

- (void)swipeMe:(UISwipeGestureRecognizer *)swipe {
    switch (swipe.direction) {
        case UISwipeGestureRecognizerDirectionUp:
            NSLog(@"Swipe up");
            break;
        case UISwipeGestureRecognizerDirectionDown:
            NSLog(@"Swipe down");
            break;
        default:
            break;
            
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"Motion began");
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"Motion ended");
}

@end
