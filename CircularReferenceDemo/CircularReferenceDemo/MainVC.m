//
//  MainVC.m
//  CircularReferenceDemo
//
//  Created by king on 2020/7/8.
//  Copyright © 2020 kingsely. All rights reserved.
//

#import "MainVC.h"

#import "TestCircularUseVC.h"

@interface MainVC ()

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    UIButton *btnTest = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 300, 100)];
    
    [btnTest setTitle:@"测试循环引用" forState:UIControlStateNormal];
    
    [btnTest addTarget:self action:@selector(btnTestAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnTest];
}


- (void)btnTestAction:(UIButton *)button {
    
    TestCircularUseVC *ctrl = [[TestCircularUseVC alloc] init];
    
    [self.navigationController pushViewController:ctrl animated:YES];
}

@end
