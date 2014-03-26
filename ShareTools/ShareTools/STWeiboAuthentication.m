//
//  STWeiboAuthentication.m
//  ShareTools
//
//  Created by linjinxing on 14-3-25.
//  Copyright (c) 2014年 ST. All rights reserved.
//

#import "STWeiboAuthentication.h"
#import "WeiboSDK.h"


#define kRedirectURI    @"http://www.sina.com"

@interface STWeiboAuthentication()<WeiboSDKDelegate>
@property(nonatomic, copy)STErrorBlock completion;
@property(nonatomic, strong)NSString* token;
@end

@implementation STWeiboAuthentication
@synthesize token;

- (instancetype)initWithAPIKey:(NSString*)apikey
{
    self = [super init];
    if (self) {
        [WeiboSDK enableDebugMode:YES];
        [WeiboSDK registerApp:apikey];
    }
    return self;
}

- (void)requestAuthenticationWithCompletion:(STErrorBlock)completion
{
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = kRedirectURI;
    request.scope = @"all";
    [WeiboSDK sendRequest:request];
}

- (void)exit
{
    
}

#pragma mark - delegate 


- (void)didReceiveWeiboRequest:(WBBaseRequest *)request
{
    if ([request isKindOfClass:WBProvideMessageForWeiboRequest.class])
    {

    }
}

- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    if ([response isKindOfClass:WBSendMessageToWeiboResponse.class])
    {
//        NSString *title = @"发送结果";
//        NSString *message = [NSString stringWithFormat:@"响应状态: %d\n响应UserInfo数据: %@\n原请求UserInfo数据: %@",(int)response.statusCode, response.userInfo, response.requestUserInfo];
    }
    else if ([response isKindOfClass:WBAuthorizeResponse.class])
    {
        NSString *title = @"认证结果";
        NSString *message = [NSString stringWithFormat:@"响应状态: %d\nresponse.userId: %@\nresponse.accessToken: %@\n响应UserInfo数据: %@\n原请求UserInfo数据: %@",(int)response.statusCode,[(WBAuthorizeResponse *)response userID], [(WBAuthorizeResponse *)response accessToken], response.userInfo, response.requestUserInfo];
        NSLog(@"title:%@, message:%@", title, message);

        self.token = [(WBAuthorizeResponse *)response accessToken];
        
    }
}

- (void)handleOpenApplicationURL:(NSURL *)url
{
    [WeiboSDK handleOpenURL:url delegate:self];
}

@end
