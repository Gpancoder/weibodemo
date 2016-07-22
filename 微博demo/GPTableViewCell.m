//
//  GPTableViewCell.m
//  微博demo
//
//  Created by subaozi on 16/7/21.
//  Copyright © 2016年 com.jujiawuyou. All rights reserved.
//

#import "GPTableViewCell.h"
#import "statusFrame.h"
#import "status.h"

@interface GPTableViewCell ()

@property (nonatomic, weak) UIImageView *icon;
@property (nonatomic, weak) UILabel *namelabel;
@property (nonatomic, weak) UIImageView *vip;
@property (nonatomic, weak) UILabel *text;
@property (nonatomic, weak) UIImageView *picture;


@end

@implementation GPTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //添加cell中所需要的子控件
        
        UIImageView *iconImageView = [[UIImageView alloc] init];
//        iconImageView.frame = CGRectMake(0, 0, 100, 20);
        [self.contentView addSubview:iconImageView];
  
        self.icon = iconImageView;
        
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font =  nameFont;
        nameLabel.textColor = [UIColor redColor];
        [self.contentView addSubview:nameLabel];
        self.namelabel = nameLabel;
        
        UIImageView *vipImageView = [[UIImageView alloc] init];
        vipImageView.image = [UIImage imageNamed:@"vip"];
        [self.contentView addSubview:vipImageView];
        self.vip = vipImageView;
        
        UILabel *textLabel = [[UILabel alloc] init];
        textLabel.font = txtFont;
        textLabel.numberOfLines = 0;
        [self.contentView addSubview:textLabel];
        self.text = textLabel;
        
        UIImageView *picture = [[UIImageView alloc] init];
        [self.contentView addSubview:picture];
        self.picture = picture;
    }
    return self;
}



-(void)setStatusFrame:(statusFrame *)statusFrame{
    _statusFrame = statusFrame;
    [self setdate];
    [self setFrame];
}
-(void)setdate{
    status *status = self.statusFrame.status;
    self.icon.image = [UIImage imageNamed:status.icon];
    
    self.namelabel.text = status.name;
    if (status.isVip) {
        self.vip.hidden = NO;
    }else{
        self.vip.hidden = YES;
    }
    self.text.text = status.text;
    self.picture.image = [UIImage imageNamed:status.picture];
    NSLog(@"%@",self.statusFrame);
    
}

-(void)setFrame{
    self.icon.frame = self.statusFrame.iconF;
    self.namelabel.frame = self.statusFrame.nameF;
    self.vip.frame = self.statusFrame.vipF;
    self.text.frame = self.statusFrame.textF;
    self.picture.frame = self.statusFrame.pictureF;
    
}






@end
