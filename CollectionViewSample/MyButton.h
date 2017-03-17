//
//  MyButton.h
//  CollectionViewSample
//
//  Created by jackiege on 17/03/2017.
//  Copyright © 2017 jackiege. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyButton : UIButton
+(instancetype)myButtonWithFrame:(CGRect)frame
                           title:(NSString *)title
                       imageName:(NSString *)imageName;
@end
