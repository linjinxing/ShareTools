//
//  STAuth.m
//  ShareTools
//
//  Created by linjinxing on 14-3-25.
//  Copyright (c) 2014年 ST. All rights reserved.
//

#import "STAuthentication.h"

@interface STAuthentication()
@property(nonatomic, copy)STErrorBlock authticationCompletion;
@end

@implementation STAuthentication
@synthesize token;

- (instancetype)initWithAPIKey:(NSString*)apikey
{
    return nil;
}

- (void)requestAuthenticationWithCompletion:(STErrorBlock)completion
{
    
}

- (void)exit
{
    
}

- (void)handleOpenApplicationURL:(NSURL *)url
{
    
}

@end
