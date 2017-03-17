//
//  ThirdViewController.m
//  CollectionViewSample
//
//  Created by jackiege on 17/03/2017.
//  Copyright © 2017 jackiege. All rights reserved.
//

#import "ThirdViewController.h"
#import "MyBallView.h"

@interface ThirdViewController ()


@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MyBallView *ball = [[MyBallView alloc] initWithFrame:CGRectMake(20, 30, 100, 100)];
    [self.view addSubview:ball];
    // Do any additional setup after loading the view.
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
