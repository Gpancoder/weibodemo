//
//  statusFrame.h
//  微博demo
//
//  Created by subaozi on 16/7/21.
//  Copyright © 2016年 com.jujiawuyou. All rights reserved.
//

#import <UIKit/UIKit.h>

#define nameFont [UIFont systemFontOfSize:14]
#define txtFont [UIFont systemFontOfSize:14]
@class status;
@interface statusFrame : NSObject
@property (nonatomic, strong) status *status;

@property (nonatomic, assign) CGRect iconF;
@property (nonatomic, assign) CGRect nameF;
@property (nonatomic, assign) CGRect vipF;
@property (nonatomic, assign) CGRect textF;
@property (nonatomic, assign) CGRect pictureF;

@property (nonatomic, assign) CGFloat cellHeight;


@end
