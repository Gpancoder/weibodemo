//
//  statusFrame.m
//  微博demo
//
//  Created by subaozi on 16/7/21.
//  Copyright © 2016年 com.jujiawuyou. All rights reserved.
//

#import "statusFrame.h"
#import "status.h"
#define nameFont [UIFont systemFontOfSize:14]
#define txtFont [UIFont systemFontofSize:14]

@implementation statusFrame

-(void)setStatus:(status *)status{
    _status = status;
    //计算所有子控件的尺寸
    //1.头像尺寸
    CGFloat margin = 8;
    
    CGFloat iconX = margin;
    CGFloat iconY = margin;
    CGFloat iconW = 40;
    CGFloat iconH = iconW;
    _iconF = CGRectMake(iconX, iconY, iconW, iconH);
    // 2. 名字尺寸
    CGSize nameMaxSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
//    CGFloat nameY =
    CGSize nameSize = [self text:self.status.name textMaxSize:nameMaxSize textFont:nameFont];
    
    CGFloat nameX = CGRectGetMaxX(_iconF) + margin;
    CGFloat nameY = (iconH - nameSize.height) * 0.5 + margin;
    _nameF = (CGRect){{nameX,nameY},nameSize};
    
    //3.vip
    if (status.isVip) {
        CGFloat vipW = 10;
        CGFloat vipH = vipW;
        CGFloat vipX = CGRectGetMaxX(_nameF) + margin;
        CGFloat vipY = (iconH - vipH) * 0.5 + margin;
        _vipF = CGRectMake(vipX, vipY, vipW, vipH);
    }
    
    //4.正文
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(_iconF) + margin;
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    
    CGSize textMaxSize = CGSizeMake((screenW - 2 * margin), MAXFLOAT);
    CGSize textSize = [self text:status.text textMaxSize:textMaxSize textFont:[UIFont systemFontOfSize:14]];
    _textF = (CGRect){{textX,textY},textSize};
    
    // 5. 配图
    if (status.picture) {
        CGFloat pictureX = iconX;
        CGFloat pictureY = CGRectGetMaxY(_textF) + margin;
        CGFloat pictureW = 100;
        CGFloat pictureH = pictureW;
        _pictureF = CGRectMake(pictureX, pictureY, pictureW, pictureH);
    }
    
    
    
    // 计算cell的好高
    CGFloat textMaxY = CGRectGetMaxY(_textF);
    CGFloat PictureMaxY = CGRectGetMaxY(_pictureF);
    
    _cellHeight = MAX(textMaxY, PictureMaxY) + margin;
    
    
    
    
    
    
}


/**
 *  计算文字的尺寸
 *
 *  @param text    需要计算的文本
 *  @param Maxsize 规定的文字尺寸范围，一般只限宽度，不显高度
 *  @param font    计算文字的字体大小
 *
 *  @return 计算出来的文字尺寸
 */
-(CGSize)text:(NSString *)text textMaxSize:(CGSize)Maxsize textFont:(UIFont *)font{
    NSDictionary *attr = @{NSFontAttributeName : font};
    
    return [text boundingRectWithSize:Maxsize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}



@end
