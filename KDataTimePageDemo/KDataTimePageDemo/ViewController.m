//
//  ViewController.m
//  KDataTimePageDemo
//
//  Created by kai.shang on 16/1/9.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "ViewController.h"
#import "KDateTimeViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.title = @"选择日期时间控件Demo";
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) clickDateTimePage:(id)sender{

    KDateTimeViewController *dateTimeViewController = [[KDateTimeViewController alloc] initWithNibName:@"KDateTimeView" bundle:nil];
    

    [self.navigationController pushViewController:dateTimeViewController animated:YES];
}

@end
