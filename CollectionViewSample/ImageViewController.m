//
//  ImageViewController.m
//  CollectionViewSample
//
//  Created by jackiege on 17/03/2017.
//  Copyright © 2017 jackiege. All rights reserved.
//

#import "ImageViewController.h"
#import "ScrollViewController.h"

@interface ImageViewController ()
{
    long count;;
}

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"精彩图片";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 500, 80, 30);
    button.backgroundColor = [UIColor greenColor];
    [button setTitle:@"BACK" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backToMainView) forControlEvents:UIControlEventTouchUpInside];
    button.layer.borderColor = [UIColor redColor].CGColor;
    button.layer.borderWidth = 2;
    button.layer.cornerRadius = 5;
    button.layer.masksToBounds = YES;
    [self.view addSubview:button];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(140, 500, 80, 30);
    button2.backgroundColor = [UIColor greenColor];
    [button2 setTitle:@"滚动图库" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(goToScorllImage) forControlEvents:UIControlEventTouchUpInside];
    button2.layer.borderColor = [UIColor redColor].CGColor;
    button2.layer.borderWidth = 2;
    button2.layer.cornerRadius = 5;
    button2.layer.masksToBounds = YES;
    [self.view addSubview:button2];


    // Do any additional setup after loading the view.
    
    UIImageView *imageV =  [[UIImageView alloc] initWithFrame:CGRectMake(20, 50, 400, 400)];
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
    
    
    // pinch 缩放
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchMe:)];
    [imageV addGestureRecognizer:pinch];
    
    // pan 拖拽
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panMe:)];
    [imageV addGestureRecognizer:pan];
    
    // rotate 旋转
    
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateMe:)];
    [imageV addGestureRecognizer:rotation];
    
}

- (void)goToScorllImage {
    ScrollViewController *scroll = [[ScrollViewController alloc] init];
    [self.navigationController pushViewController:scroll animated:YES];
}

- (void)rotateMe:(UIRotationGestureRecognizer *)rotation {
    // get view
    UIImageView *imageV = (UIImageView *)rotation.view;
    
    // tranform
    imageV.transform = CGAffineTransformRotate(imageV.transform, rotation.rotation);
    
    // reset rotation
    rotation.rotation = 0;
}

- (void)panMe:(UIPanGestureRecognizer *)pan {
    // 获取view
    UIImageView *imageV = (UIImageView *)pan.view;
    
    // 获取新的位置
    CGPoint point = [pan translationInView:imageV];
    
    // 变换矩阵
    imageV.transform = CGAffineTransformTranslate(imageV.transform, point.x, point.y);
    
    //
    [pan setTranslation:CGPointZero inView:imageV];
}

- (void)pinchMe:(UIPinchGestureRecognizer *)pinch {
    // 获取缩放手势所指视图， 这里我们缩放的是Image View （因为我们把pinch 手势添加到了Image View）
    UIImageView *imageV = (UIImageView *)pinch.view;
    // 矩阵变换：改变image V的 tansform，这里是长宽等比例缩放
    imageV.transform = CGAffineTransformScale(imageV.transform, pinch.scale, pinch.scale);
    // 重要： 缩放比例参照原始图片的大小， 否则缩放的速度将会愈来愈快（指数级） 而非线性的。
    pinch.scale = 1;
    // 提示： 按住Alt （option）键，模拟器上会出现两个圆圈，按住鼠标左键移动，即可缩放。
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

- (void)backToMainView {
    [self dismissViewControllerAnimated:YES completion:^{
        
        
    }];
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
