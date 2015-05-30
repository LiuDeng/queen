//
//  QWValidator.m
//  queen
//
//  Created by wenlin on 15/5/30.
//  Copyright (c) 2015年 BRYQ. All rights reserved.
//

#import "QWValidator.h"


@implementation QWValidator


+ (BOOL)checkNullString:(NSString*)string title:(NSString*)title{
    
    NSString *trimString = [QWHelper trimString:string];
    
    if ([trimString isEqualToString:@""] || (!string)) {
        [QWHelper showErrorMessage:@"%@不能为空"];
        return NO;
    }else return YES;
    
}

+ (BOOL)validateUserName:(NSString*)userName{
    
     NSString *trimUserName = [QWHelper trimString:userName];
    
    if (![QWValidator checkNullString:trimUserName title:@"用户名"]) {
        return NO;
    }
    
    BOOL isMatched = [trimUserName isMatch:RX(@"^[a-zA-Z][a-zA-Z0-9_]{5,9}$")];
    
    if (!isMatched) {
        [QWHelper showErrorMessage:@"海盗ID格式不符,请重新输入"];
        return NO;
    }
    
    return YES;
}


+ (BOOL)validateDisplayName:(NSString*)displayName{
    
    NSString *trimDisplayName = [QWHelper trimString:displayName];

    if (![QWValidator checkNullString:displayName title:@"昵称"]) {
        return NO;
    }
    
    //长度在2位~12位之间
    if (trimDisplayName.length < 2) {
        [QWHelper showErrorMessage:@"昵称不能少于2字符"];
        return NO;
    }
    
    if (trimDisplayName.length > 12) {
        [QWHelper showErrorMessage:@"昵称不能多于12字符"];
        return NO;
    }
    
    //不能全为数字
    BOOL isMatch = [trimDisplayName isMatch:RX(@"^\\d+$")];
    
    if (isMatch) {
        [QWHelper showErrorMessage:@"用户昵称不能全为数字"];
        return NO;
    }
    
    return YES;

}

+ (BOOL)validateMobilePhone:(NSString *)mobile{
    
    if (![QWValidator checkNullString:mobile title:@"手机号码"]) {
        return NO;
    }
    
    NSString *trimMobile = [QWHelper trimString:mobile];
    
    //1开头,10位数字
    BOOL isMatch = [trimMobile isMatch:RX(@"^1[3|4|5|8][0-9]{9}$")];
    
    if (isMatch) {
        [QWHelper showErrorMessage:@"用户昵称不能全为数字"];
        return NO;
    }
    
    return YES;
}

+ (BOOL)validateEmail:(NSString*)email{
    
    if (![QWValidator checkNullString:email title:@"邮箱"]) {
        return NO;
    }
    
    NSString *trimEmail = [QWHelper trimString:email];
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    if (![emailTest evaluateWithObject:trimEmail]) {
        [QWHelper showErrorMessage:@"邮箱地址格式不正常"];
        return NO;
    }
    
    return YES;
}


@end
