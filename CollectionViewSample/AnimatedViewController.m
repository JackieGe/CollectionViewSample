//
//  AnimatedViewController.m
//  CollectionViewSample
//
//  Created by jackiege on 16/03/2017.
//  Copyright © 2017 jackiege. All rights reserved.
//

#import "AnimatedViewController.h"

@interface AnimatedViewController ()
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation AnimatedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 200, 200)];
    [self.view addSubview:_imageView];
    _imageView.backgroundColor = [UIColor grayColor];
    
    
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.backgroundColor = [UIColor redColor];
    button1.frame = CGRectMake(20, 300, 80, 20);
    [self.view addSubview:button1];
    [button1 addTarget:self action:@selector(startAnimate) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.backgroundColor = [UIColor redColor];
    button2.frame = CGRectMake(120, 300, 80, 20);
    [self.view addSubview:button2];
    [button2 addTarget:self action:@selector(stopAnimate) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view.
}

- (void)startAnimate {
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"events" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:plistPath];
    NSMutableArray *images = [NSMutableArray array];
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dict = obj;
            NSLog(@"%@", dict[@"image"]);
            UIImage *ima = [UIImage imageNamed: dict[@"image"]];
            [images addObject:ima];
        }
        NSLog(@"idx = %zd", idx);
        
    }];
    
    self.imageView.image = images[0];
    
    self.imageView.animationImages = images;
    self.imageView.animationDuration = 2;
    self.imageView.animationRepeatCount = 100;
    [self.imageView startAnimating];
}

- (void)stopAnimate {
    [self.imageView stopAnimating];
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

@end
