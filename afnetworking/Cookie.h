//
//  Cookie.h
//  afnetworking
//
//  Created by 王玉翠 on 16/8/4.
//  Copyright © 2016年 王玉翠. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cookie : NSObject


//保存cookie,在afn成功时,执行
+(void)saveCookie;

//取出cookie,在每次需要发送请求的代码前执行这段代码
+(void)takeOutCookie;

//删除cookie,在用户退出账号前执行
+(void)delegateCookie;

//写入需要的cookie,对于服务器需要特定的cookie
+(void)needCookie;

//在webView请求时添加cookie
/**
 *在NSURLRequest *request = [NSURLRequest requestWithURL:requestUrl];
   前调用
 */
+(void)webViewAndCookie:(NSURL *)requestUrl;

@end
