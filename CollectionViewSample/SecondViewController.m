//
//  SecondViewController.m
//  CollectionViewSample
//
//  Created by jackiege on 16/03/2017.
//  Copyright © 2017 jackiege. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor greenColor];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.backgroundColor = [UIColor yellowColor];
    button1.frame = CGRectMake(10, 50, 200, 120);
    [button1 setTitle:@"Click me" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button1 setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    
    [button1 setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 10)];
    [button1 setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
    
    //UIImage *image = [UIImage imageNamed:@"archery.gif"];
    
    
    [button1 setImage:[UIImage imageNamed:@"boxing.gif"] forState:UIControlStateNormal];
    [self.view addSubview:button1];
    
    [button1 addTarget:self action:@selector(jumpBack) forControlEvents:UIControlEventTouchUpInside];

    // Do any additional setup after loading the view.
}

- (void)jumpBack {
    NSLog(@"start to jump back");
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Finished jump back");
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

@end
