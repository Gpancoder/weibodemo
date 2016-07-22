//
//  status.h
//  微博demo
//
//  Created by subaozi on 16/7/21.
//  Copyright © 2016年 com.jujiawuyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface status : NSObject
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign,getter=isVip) BOOL vip;
@property (nonatomic, copy) NSString *picture;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)statusWithDict:(NSDictionary *)dict;

@end
