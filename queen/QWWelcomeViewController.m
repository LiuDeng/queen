//
//  WelcomeViewController.m
//  RACDemo
//
//  Created by wenlin on 14-1-22.
//  Copyright (c) 2014年 bryq. All rights reserved.
//

#import "QWWelcomeViewController.h"


@interface QWWelcomeViewController ()


- (IBAction)login:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *mobileTextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;


@end

@implementation QWWelcomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIColor *color = [UIColor groupTableViewBackgroundColor];
    self.mobileTextfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入手机号码" attributes:@{NSForegroundColorAttributeName:color}];
    self.passwordTextfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请填写密码(不少于6位数)" attributes:@{NSForegroundColorAttributeName:color}];
    
    //self.mobileTextfield.at
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    //[MobClick beginLogPageView:@"Welcome"];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:YES];
    //[MobClick endLogPageView:@"Welcome"];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
    [self performSegueWithIdentifier:@"LoginSegue" sender:self];
}

@end
