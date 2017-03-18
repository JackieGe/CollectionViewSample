//
//  SegmentViewController.m
//  CollectionViewSample
//
//  Created by jackiege on 18/03/2017.
//  Copyright © 2017 jackiege. All rights reserved.
//

#import "SegmentViewController.h"

@interface SegmentViewController ()

@end

@implementation SegmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *array = @[@"亚洲",@"欧美",@"日韩"];
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:array];
    [self.view addSubview:seg];
    seg.tintColor = [UIColor redColor];
    seg.selectedSegmentIndex = 1;
    [seg setTitle:@"动漫" forSegmentAtIndex:2];
    seg.frame = CGRectMake(20, 40, 300, 50);
    
    UIImage *anImage = [UIImage imageNamed:@"canoe-sprint.gif"];
    anImage = [anImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [seg setImage:anImage forSegmentAtIndex:0];
    [seg addTarget:self action:@selector(selectWhich:) forControlEvents:UIControlEventValueChanged];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
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
}

- (void)selectWhich:(UISegmentedControl *)seg {
    if (seg.selectedSegmentIndex == 0) {
        NSLog(@"Open 亚洲");
    } else if (seg.selectedSegmentIndex == 1) {
         NSLog(@"Open 欧美");
    } else {
         NSLog(@"Open 日韩");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    // Dispose of any resources that can be recreated.
}

- (void)backToMainView {
    [self dismissViewControllerAnimated:YES completion:^{
        
        
    }];
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
