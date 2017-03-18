//
//  ScrollViewController.m
//  CollectionViewSample
//
//  Created by jackiege on 18/03/2017.
//  Copyright © 2017 jackiege. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController () <UIScrollViewDelegate>
{
    int width;
    UIScrollView *scrollView;
    UIPageControl *pageControl;
}
@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
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
    
    width = 200;
    CGFloat heigh = 200;
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, 50, width, heigh)];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"events" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:plistPath];
    scrollView.contentSize = CGSizeMake(width * array.count, heigh);
    [self.view addSubview:scrollView];
    scrollView.backgroundColor = [UIColor yellowColor];

    int i = 0;
    
    for (NSDictionary *dict in array) {
        NSString *imageName = dict[@"image"];
        UIImage *image = [UIImage imageNamed:imageName];
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(width * i, 0, width, heigh)];
        imageV.image = image;
        [scrollView addSubview:imageV];
        
        i++;
    }
    
    int defaultPageNum = 2;
    
    scrollView.pagingEnabled = YES;
    scrollView.contentOffset = CGPointMake(width * defaultPageNum, 0);
    scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    
    scrollView.delegate = self;
    
    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(40, 280, 200, 30)];
    pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    pageControl.pageIndicatorTintColor = [UIColor redColor];
    [self.view addSubview:pageControl];
    [pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    pageControl.numberOfPages = array.count;
    pageControl.currentPage = defaultPageNum;
    pageControl.backgroundColor = [UIColor yellowColor];
    // scrollView.bounces = NO;

    // Do any additional setup after loading the view.
}

- (void)changePage:(UIPageControl *)pageC {
    [scrollView setContentOffset:CGPointMake(width * pageC.currentPage, 0) animated:YES];
}

- (void)backToMainView {
    [self dismissViewControllerAnimated:YES completion:^{
        
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // int pageNum = scrollView.contentOffset.x / width;
    // NSLog(@"current #page: %d", pageNum);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"begin dragging");
    int pageNum = scrollView.contentOffset.x / width;
    NSLog(@"current #page: %d", pageNum + 1);
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"End dragging");
    int pageNum = scrollView.contentOffset.x / width;
    NSLog(@"current #page: %d", pageNum + 1);

}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    NSLog(@"begin decelerating");
    int pageNum = scrollView.contentOffset.x / width;
    NSLog(@"current #page: %d", pageNum + 1);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"end decelerating");
    NSInteger pageNum = scrollView.contentOffset.x / width;
    NSLog(@"current #page: %zd", pageNum + 1);
    pageControl.currentPage = pageNum;
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
