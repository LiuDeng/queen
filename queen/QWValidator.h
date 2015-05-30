//
//  QWValidator.h
//  queen
//
//  Created by wenlin on 15/5/30.
//  Copyright (c) 2015年 BRYQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QWHelper.h"
#import <RegExCategories/RegExCategories.h>

@interface QWValidator : NSObject

//校验string是否为空
+ (BOOL)checkNullString:(NSString*)string title:(NSString*)title;
//校验用户名
+ (BOOL)validateUserName:(NSString*)userName;
//校验用户昵称
+ (BOOL)validateDisplayName:(NSString*)displayName;
//校验手机号
+ (BOOL)validateMobilePhone:(NSString*)mobile;
//校验邮箱
+ (BOOL)validateEmail:(NSString*)email;


@end
