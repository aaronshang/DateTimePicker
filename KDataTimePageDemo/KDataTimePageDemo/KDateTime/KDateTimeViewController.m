//
//  KDateTimeViewController.m
//  KDataTimePageDemo
//
//  Created by kai.shang on 16/1/9.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "KDateTimeViewController.h"

@interface KDateTimeViewController()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *mLeftLabelNameAry;

@end

@implementation KDateTimeViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.title = @"时间设置";
    self.mLeftLabelNameAry = @[@"全天", @"时间设置", @""];
    
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
}


#pragma mark-

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.mLeftLabelNameAry count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CELLIDIDENTITER = @"CELLIDIDENTITER";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLIDIDENTITER];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CELLIDIDENTITER];
    }
    
    cell.textLabel.text = [self.mLeftLabelNameAry objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = @"2014-1-1 08:09";
    
    
    
    return  cell;
}



@end
