//
//  STSocialShareProtocol.h
//  ShareTools
//
//  Created by linjinxing on 14-3-26.
//  Copyright (c) 2014年 ST. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol STSocialShareProtocol <NSObject>
- (void)shareMessage:(NSString*)string;
- (void)shareMessage:(NSString*)string andImage:(UIImage*)image;
@end
