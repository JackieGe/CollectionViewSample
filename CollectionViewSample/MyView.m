//
//  MyView.m
//  CollectionViewSample
//
//  Created by jackiege on 17/03/2017.
//  Copyright © 2017 jackiege. All rights reserved.
//

#import "MyView.h"

@interface MyView () <UITextFieldDelegate>

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UITextField *textField;

@end

@implementation MyView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.backgroundColor = [UIColor cyanColor];
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 80, 40)];
        _label.backgroundColor = [UIColor redColor];
        [self addSubview:_label];
        
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(90, 5, 120, 40)];
        _textField.backgroundColor = [UIColor greenColor];
        _textField.delegate = self;
        _textField.keyboardType = UIKeyboardTypeTwitter;
        _textField.textContentType = UITextContentTypeName;
        _textField.returnKeyType = UIReturnKeyRoute;
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self addSubview:_textField];
    }
    return self;
}

#pragma mark -- implement MyView.h
- (void)setLabelText:(NSString *)text {
    self.label.text = text;
    self.textField.placeholder = [NSString stringWithFormat:@"Please input %@", text];
}

- (NSString *)text {
    return self.textField.text;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark -- implement UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // [textField endEditing:YES];
    [self.textField resignFirstResponder];
    NSLog(@"You input: %@", self.textField.text);
    
    return YES;
}

@end
