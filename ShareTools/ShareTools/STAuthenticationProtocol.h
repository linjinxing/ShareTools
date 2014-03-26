//
//  STAuthProtocol.h
//  ShareTools
//
//  Created by linjinxing on 14-3-25.
//  Copyright (c) 2014年 ST. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol STAuthentication <NSObject>

@property(nonatomic, strong, readonly)NSString* token;

/* apikey初始化 */
- (instancetype)initWithAPIKey:(NSString*)apikey;

/* 请求认证 */
- (void)requestAuthenticationWithCompletion:(STErrorBlock)completion;

/* 退出认证 */
- (void)exit;

/* 第三方认证回调方式打开应用程序url */
- (void)handleOpenApplicationURL:(NSURL *)url;
@end

