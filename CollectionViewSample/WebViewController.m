//
//  WebViewController.m
//  CollectionViewSample
//
//  Created by jackiege on 16/03/2017.
//  Copyright © 2017 jackiege. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)searchBaidu:(id)sender {
    NSString *urlString = @"https://www.baidu.com/s?ie=utf-8&f=8&rsv_bp=0&rsv_idx=1&tn=baidu&wd=objective&rsv_pq=ea61038f00017529&rsv_t=dda9hprpLfzR29303aA8vFicZfCoq1PdFz2cSJNjjNh30GjCXm8WKqX9bxc&rqlang=cn&rsv_enter=1&rsv_sug3=10&rsv_sug1=9&rsv_sug7=100&rsv_sug2=0&inputT=5094&rsv_sug4=7252&rsv_sug=2";
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSLog(@"url scheme = %@", [url scheme]);
    NSLog(@"url port = %@", [url port]);
    NSLog(@"url absoluteURL = %@", [url absoluteURL]);
    NSLog(@"url relativePath = %@", [url relativePath]);
    NSLog(@"url query = %@", [url query]);
    NSLog(@"url relativePath = %@", [url pathComponents]);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];
    [request setHTTPMethod:@"GET"];
  
    NSURLResponse *response = nil;
    NSError *error = nil;
    
    
    NSData * data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if(response) {
        NSString *fetchedContent = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"fetched = %@", fetchedContent);
    }
    if(error) {
        
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

@end
