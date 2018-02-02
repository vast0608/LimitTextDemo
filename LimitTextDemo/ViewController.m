//
//  ViewController.m
//  LimitTextDemo
//
//  Created by 李晓璐 on 2018/2/2.
//  Copyright © 2018年 onmmc. All rights reserved.
//

#import "ViewController.h"
#import "TextFieldOrTextViewLimit.h"
@interface ViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _textField.tag = 10;//限制10个字符
    [_textField addTarget:self action:@selector(textDidChange:) forControlEvents:UIControlEventEditingChanged];
    

    _textView.delegate = self;//限制12个字符
}
- (void)textFieldDidChange:(UITextField *)textField{
    [TextFieldOrTextViewLimit textDidChange:textField range:textField.tag];
}
-(void)textViewDidChange:(UITextView *)textView{
    [TextFieldOrTextViewLimit textDidChange:textView range:12];
}
@end
