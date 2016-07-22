//
//  ViewController.m
//  微博demo
//
//  Created by subaozi on 16/7/21.
//  Copyright © 2016年 com.jujiawuyou. All rights reserved.
//

#import "ViewController.h"
#import "status.h"
#import "statusFrame.h"
#import "GPTableViewCell.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *statuFrame;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",NSStringFromCGRect([self.statuFrame[1] nameF]));

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.statuFrame.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *reusID = @"cell";
    
    GPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusID];
    if (!cell) {
        cell = [[GPTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusID];

    }
    
    cell.statusFrame = self.statuFrame[indexPath.row];
    return cell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.statuFrame[indexPath.row] cellHeight];
}
-(NSArray *)statuFrame{
    if (!_statuFrame) {
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil]];
        NSMutableArray *FMarray = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            status *model = [status statusWithDict:dict];
            statusFrame *frame = [[statusFrame alloc] init];
            frame.status = model;
            [FMarray addObject:frame];
        }
        _statuFrame = FMarray;
    }
    return _statuFrame;
}



@end
