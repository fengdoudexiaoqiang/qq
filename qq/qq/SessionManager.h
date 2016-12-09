//
//  SessionManager.h
//  qq
//
//  Created by 小强 on 16/11/29.
//  Copyright © 2016年 xiao. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SessionManager : NSObject

@property (nonatomic,strong)NSURLSession *session;

+(instancetype)shareManager;

-(void)GET:(NSString *)URLString
                     success:(void(^)(NSMutableArray * ary))success
                     failure:(void (^)( NSError *error))failure;


@end
