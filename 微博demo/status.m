//
//  status.m
//  微博demo
//
//  Created by subaozi on 16/7/21.
//  Copyright © 2016年 com.jujiawuyou. All rights reserved.
//

#import "status.h"

@implementation status
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self=[self init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)statusWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
