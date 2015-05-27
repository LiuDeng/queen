//
//  QWHomeViewController.m
//  queen
//
//  Created by wenlin on 15/5/27.
//  Copyright (c) 2015年 BRYQ. All rights reserved.
//

#import "QWHomeViewController.h"

@interface QWHomeViewController ()

@end

@implementation QWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (![AVUser currentUser]) {
        [self.navigationController performSegueWithIdentifier:@"WelcomeSegue" sender:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
