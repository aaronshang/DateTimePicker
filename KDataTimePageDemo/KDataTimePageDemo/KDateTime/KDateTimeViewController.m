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
@property (strong, nonatomic) UIDatePicker *mDatePicker;
@property (strong, nonatomic) NSDate *mCurrentDate;
@property (strong, nonatomic) UISwitch *mSwitch;

@end

@implementation KDateTimeViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.title = @"时间设置";
    self.mLeftLabelNameAry = @[@"全天", @"时间设置", @""];
    
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    
    self.mDatePicker = [[UIDatePicker alloc] init];
    self.mDatePicker.datePickerMode = UIDatePickerModeDateAndTime;
    self.mCurrentDate = [NSDate date];
    
    [self.mDatePicker addTarget:self action:@selector(PickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    self.mSwitch = [[UISwitch alloc] init];
    [self.mSwitch addTarget:self action:@selector(SwithValueChanged:) forControlEvents:UIControlEventValueChanged];
    self.mSwitch.on = NO;
}

- (NSString *) getDateStrWithDate:(NSDate *) date withHaveHourMin:(BOOL) have{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    NSString *pattern = (have)?@"yyyy-MM-dd HH:mm":@"yyyy-MM-dd";
    [dateFormatter setDateFormat:pattern];
    
    NSString *currentDateStr = [dateFormatter stringFromDate:date];
    NSLog(@"currentDateStr: %@", currentDateStr);
    return currentDateStr;
}

- (void) PickerValueChanged:(id) sender{
   
    UIDatePicker* control = (UIDatePicker*)sender;
    self.mCurrentDate = control.date;
    [self.mTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:1 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
}

- (void) SwithValueChanged:(id) sender{
    
    UISwitch *switchControl = (UISwitch *)sender;
    if (switchControl.on) {
        self.mDatePicker.datePickerMode = UIDatePickerModeDate;
    }else{
        self.mDatePicker.datePickerMode = UIDatePickerModeDateAndTime;
    }
    
    [self.mTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:2 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mark-

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat rvt = (indexPath.row==2)?216:44;
    return rvt;
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
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.detailTextLabel.text = @"";
    cell.textLabel.text = [self.mLeftLabelNameAry objectAtIndex:indexPath.row];
    
    if (indexPath.row==0) {
        cell.accessoryView = self.mSwitch;
    }
    else if(indexPath.row==1){
        cell.detailTextLabel.text = [self getDateStrWithDate:self.mCurrentDate withHaveHourMin:!self.mSwitch.on];
    }
    else if(indexPath.row==2){
        cell.textLabel.text = @"";
        cell.detailTextLabel.text = @"";
        [cell.contentView addSubview:self.mDatePicker];
    }
    
    
    return  cell;
}



@end
