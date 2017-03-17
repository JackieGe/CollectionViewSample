//
//  ViewController.m
//  CollectionViewSample
//
//  Created by jackiege on 15/03/2017.
//  Copyright © 2017 jackiege. All rights reserved.
//

#import "ViewController.h"
#import "EventCollectionViewCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
{
    int COL_NUM;
}

@property (nonatomic, strong) NSArray *events;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

#pragma mark -- Implement UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    int num = [self.events count] % COL_NUM;
    if (num == 0) {//偶数
        return [self.events count] / COL_NUM;
    } else {        //奇数
        return [self.events count] / COL_NUM + 1;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return COL_NUM;
}


// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    /*
    EventCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    NSDictionary *event = self.events[indexPath.section * COL_NUM + indexPath.row];
    cell.imageView.image = [UIImage imageNamed:event[@"image"]];
    cell.label.text = event[@"name"];
    
    return cell;*/
    
    EventCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    NSDictionary *event = self.events[indexPath.section * COL_NUM + indexPath.row];
    cell.label.text = event[@"name"];
    cell.imageView.image = [UIImage imageNamed:event[@"image"]];
    
    NSLog(@"section = %zd, row = %zd, index = %zd", indexPath.section, indexPath.row,indexPath.section * COL_NUM + indexPath.row);
    
    return cell;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"events"
                                           ofType:@"plist"];
    //获取属性列表文件中的全部数据
    self.events = [[NSArray alloc] initWithContentsOfFile:plistPath];
    
    COL_NUM = 2;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *event = self.events[indexPath.section * COL_NUM  + indexPath.row];
    NSLog(@"select event name : %@", event[@"name"]);
    
}


@end
