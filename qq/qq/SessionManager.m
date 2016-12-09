//
//  SessionManager.m
//  qq
//
//  Created by 小强 on 16/11/29.
//  Copyright © 2016年 xiao. All rights reserved.
//

#import "SessionManager.h"
#import "newModel.h"

@implementation SessionManager



+(instancetype)shareManager
{
    static  SessionManager *sessionManager =nil;
    @synchronized(self) {
        sessionManager=[[self alloc]init];
    }
    return sessionManager;
}

-(NSURLSession *)session
{
    if (!_session) {
        _session =[NSURLSession sharedSession];
    }
    return _session;
}



-(void)GET:(NSString *)URLString success:(void (^)(NSMutableArray *))success failure:(void (^)(NSError *))failure
{
    NSURLSessionTask *task = [self.session dataTaskWithURL:[NSURL URLWithString:URLString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
     
        if (data !=nil) {
            NSDictionary *dic =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSMutableArray *arr =[NSMutableArray new];
            for (NSString *key in dic) {
//                NSLog(@"*****/////%@",dic[key]);
                NSMutableArray *array = dic[key];
                for (NSDictionary *di in array) {
                    newModel *model =[[newModel alloc]init];
                    [model setValuesForKeysWithDictionary:di];
                    [arr addObject:model];
                }
            }
            if (success) {
                success(arr.copy);
            }
            else if (error) {
                
            }
        }
        
    }];
    [task resume];

}



@end
