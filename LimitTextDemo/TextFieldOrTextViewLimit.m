//
//  TextFieldOrTextViewLimit.m
//  LimitTextDemo
//
//  Created by 李晓璐 on 2018/2/2.
//  Copyright © 2018年 onmmc. All rights reserved.
//

#import "TextFieldOrTextViewLimit.h"

@implementation TextFieldOrTextViewLimit

+(void)textDidChange:(id)texts range:(NSInteger)range{

    if ([texts isKindOfClass:[UITableView class]]) {
        [self textView:texts range:range];
    }else if ([texts isKindOfClass:[UITextField class]]){
        [self textField:texts range:range];
    }
}
//TextView
+(void)textView:(UITextView *)textView range:(NSInteger)range{
    NSInteger maxLength = range;
    NSString *toBeString = textView.text;
    UITextRange *selectedRange = [textView markedTextRange];
    UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制,防止中文被截断
    if (!position){
        if (toBeString.length > maxLength){
            //中文和emoj表情存在问题，需要对此进行处理
            NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, maxLength)];
            textView.text = [toBeString substringWithRange:rangeRange];
        }
    }
}
//TextField
+(void)textField:(UITextView *)textField range:(NSInteger)range{
    NSInteger maxLength = range;
    NSString *toBeString = textField.text;
    UITextRange *selectedRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制,防止中文被截断
    if (!position){
        if (toBeString.length > maxLength){
            //中文和emoj表情存在问题，需要对此进行处理
            NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, maxLength)];
            textField.text = [toBeString substringWithRange:rangeRange];
        }
    }
}
@end
