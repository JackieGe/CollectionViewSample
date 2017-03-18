//
//  SecondViewController.m
//  CollectionViewSample
//
//  Created by jackiege on 16/03/2017.
//  Copyright © 2017 jackiege. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
{
    UITextField *textField;
}
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
    
    textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 200, 100, 30)];
    textField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:textField];
    
    UISwitch *sw = [[UISwitch alloc] initWithFrame:CGRectMake(20, 250, 0, 0)];
    /*
    sw.tintColor = [UIColor yellowColor];
    sw.onTintColor = [UIColor redColor];
    sw.thumbTintColor = [UIColor redColor];
    */
    
    [self.view addSubview:sw];
    [sw addTarget:self action:@selector(changeSwitch:) forControlEvents:UIControlEventValueChanged];
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(20, 300, 200, 30)];
    slider.thumbTintColor = [UIColor redColor];
    slider.maximumTrackTintColor = [UIColor lightGrayColor];
    slider.minimumTrackTintColor = [UIColor redColor];
    slider.minimumValue = 0;
    slider.maximumValue = 1000;
    [slider addTarget:self action:@selector(slideMe:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];

    // Do any additional setup after loading the view.
}

- (void)slideMe:(UISlider *)slider {
    NSLog(@"%f",slider.value);
}

- (void)changeSwitch:(UISwitch *)sw {
    /*
    if (sw.on) {
        [textField setEnabled:YES];
    } else {
        [textField setEnabled:NO];
    }*/
    textField.enabled = sw.on;
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
