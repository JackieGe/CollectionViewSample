//
//  ImageViewController.m
//  CollectionViewSample
//
//  Created by jackiege on 17/03/2017.
//  Copyright © 2017 jackiege. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

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
    
    
}

- (void)tapMe {
    NSLog(@"tap me");
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
